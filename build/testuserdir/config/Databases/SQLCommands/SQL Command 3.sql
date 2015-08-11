drop database evaluation_system;
create database evaluation_system;
use evaluation_system;
select * from evaluation_system.measured;
select * from evaluation_system.evaluation_type;
select * from evaluation_system.profile;
select * from evaluation_system.measured where email like '%marcos.santana%';
ALTER TABLE evaluation ADD COLUMN `date_last_update` TIMESTAMP DEFAULT CURRENT_TIMESTAMP  AFTER `date_send_mensurer` ;
ALTER TABLE `evaluation` change COLUMN `date_send_mensured` `date_send_measured` DATETIME DEFAULT NULL;

drop function if exists geraPU;
-- --------------------------------------------------------------------------------
-- Routine DDL
-- Note: comments before and after the routine body will not be stored by the server
-- --------------------------------------------------------------------------------
DELIMITER $$

CREATE FUNCTION `geraPU`(param char(60)) RETURNS varchar(255) CHARSET latin1
    DETERMINISTIC
BEGIN
declare count,count1,count2   INT default 0;
declare dado,dado1,dado2,dado3,dado4,dado5,dado6,dado7,dado8,dado9,dados char(60);

set param   = replace(replace(replace(replace(replace(replace(replace(replace(replace(replace(replace(replace(replace(replace(replace(replace(replace(replace(replace(replace(replace(replace(replace(replace(param,'/r',''),'/n',''),'*',''),'"',''),'@',''),'#',''),'$',''),'%',''),'.',''),'&',''),'(',''),')',''),'--',''),'+',''),'=',''),'�',''),'�',''),'.',''),',',''),'[',''),'{',''),'}',''),']',''),'?','');
set count1  = length(param);
set dado1   = (select lower(substring(param,1,1)));
set dado2   = (select lower(substring(param,2,1)));
set dados    = '';

while count <= count1 do

      set count = count + 1;            
      set count2= count + 1;    
        
      set dado3 = (select lower(substring(param,count,1)));
      set dado4 = (select lower(substring(param,count2,1)));                    
      set dado3 = if((dado3 regexp "[0-9]"=1) or (dado3 regexp "[a-z]"=1),dado3,'');                              
      set dado5 = if((dado3 regexp "[0-9]"=1) and (dado4 regexp "[0-9]"=1),'','-');                        
      set dado5 = if((count=count1 or dado4 is null or dado4='' or dado4='/' or dado4='*' or dado4='.' or dado4='-' or dado4=' '),'',dado5);      
      set dados =  replace((replace((replace((replace((replace(replace(dados,'"',''),'?','')),' ','')),'*','')),'.','')),'/','');
      set dados = (select concat(dados,dado3,dado5));

end while;

set count  = 0;
set count2 = 0;

while count <=count1 do
       
       set count  = count + 1;
       set count2 = count + 1;
       /* set dados = if((select lower(substring(dados,count,1)))='-',concat((select lower(substring(dados,count,1))),dados),dados);     */ 

       set dados = if((select lower(substring(dados,count,1)))='-',concat((select lower(substring(dados,count2,length(dados))))),dados);
              
       /* set dados = if(dados regexp "-$"=1,(select lower(substring(dados,count,1))),dados);  */
       

end while;


return dados;

END




-- Function: cs_update()

-- DROP FUNCTION cs_update();

CREATE OR REPLACE FUNCTION cs_update()
  RETURNS void AS
$BODY$
DECLARE
	referrer_key RECORD;
BEGIN

	FOR referrer_key IN (
		SELECT
				CASE
				WHEN (sl_status = 19 and sl_status_detalhe in (1,2,7) and contaprop<3)  THEN (substr(sl_status_dt+ '30 days'  ::interval ,1,10))::date
				WHEN (sl_status = 19 and sl_status_detalhe in (3,5,6) and contaprop<3)  THEN (substr(sl_status_dt+ '180 days' ::interval ,1,10))::date
				WHEN (sl_status = 29 and sl_status_detalhe in (1,4) and contaprop<3)    THEN (substr(sl_status_dt+ '30 days'  ::interval ,1,10))::date
				WHEN (sl_status = 19 and sl_status_detalhe in (1,2,7) and contaprop>=3) THEN (substr(sl_status_dt+ '180 days' ::interval ,1,10))::date
				WHEN (sl_status = 19 and sl_status_detalhe in (3,5,6) and contaprop>=3) THEN (substr(sl_status_dt+ '180 days' ::interval ,1,10))::date
				WHEN (sl_status = 29 and sl_status_detalhe in (1,4) and contaprop>=3)   THEN (substr(sl_status_dt+ '180 days' ::interval ,1,10))::date
				END
				as newtime,sl_status_dt,cpf ,sl_status,sl_status_detalhe
		FROM 		prv_alunos
		WHERE
				(
					(sl_status = 19 and sl_status_detalhe in (1,2,3,5,6,7))
					or (sl_status = 29 and sl_status_detalhe in (1,4))
				)
					and aluno_calc_dias isnull
		)
	LOOP

		UPDATE prv_alunos SET aluno_calc_dias = referrer_key.newtime WHERE cpf = referrer_key.cpf;
	END LOOP;

END;
$BODY$
  LANGUAGE plpgsql VOLATILE;
ALTER FUNCTION cs_update() OWNER TO tedablio;
COMMENT ON FUNCTION cs_update() IS 'Atualiza o campo aluno_calc_dias com data de liberação de proposta';

