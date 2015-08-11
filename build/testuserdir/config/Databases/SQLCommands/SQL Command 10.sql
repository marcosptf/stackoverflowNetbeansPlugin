select * from mobile_br.fabricantemodelo;
select * from mobile_br.licenca;
select * from mobile_br.perfil;
select * from mobile_br.licencatipo;
select * from mobile_br.produto;
select * from mobile_br.pacote;
select * from mobile_br.pacoteaquisicao;
update mobile_br.pacoteaquisicao set st_pacoteaquisicao='0' where idClienteFone='470';
select * from mobile_br.pacoteaquisicao where idClienteFone='470';
select * from mobile_br.clientefone where ds_fone='555018970477';
update mobile_br.pacote set ds_pacote='Antiroubo',ds_pacote_detalhes='Antiroubo' where idpacote=3;
select * from mobile_mx.pacote;
select * from mobile_br.parceiro;
select * from mobile_br.usuario where idPerfil='12';
select * from mobile_br.usuario group by idPerfil;
select * from mobile_br.pacote;
select st_usuario from mobile_br.usuario;
select * from mobile_br.cliente;
select * from tss_brasil.pacoteaquisicao;
select * from tss_brasil.clientefone where idCliente='1151';
select * from mobile_br.licenca order by 1 desc;
select * from mobile_br.situacao;
select * from mobile_br.syscontato order by 1 desc;
select * from mobile_br.syscontato group by txt_mensagem;
select txt_mensagem from mobile_br.syscontato where lower(txt_mensagem) like '%dia%' group by txt_mensagem; 
select * from mobile_br.syscontatotipo order by 1 desc;
select * from mobile_br.pacoteaquisicao;
select * from tss_brasil.pacoteaquisicao where idClienteFone='1146';
select * from mobile_br.clientefone order by idClienteFone desc;
select * from mobile_br.clientefone where ds_fone='557466690188';
select * from mobile_br.clientefone where idClienteFone='538';
select * from tpa.tpa_users order by 1 desc;
select * from tpa.tpa_orders order by 1 desc;

/* rodando cancelamento st_pacoteaquisicao=>0  de uma compra nova*/
select * from mobile_br.pacoteaquisicao order by 1 desc;
update mobile_br.licenca set dt_cancelamento='2013-10-10 00:00:00.000',dt_termino='2012-10-10 00:00:00.000' where idpacoteaquisicao=(select idPacoteAquisicao from mobile_br.pacoteaquisicao order by 1 desc limit 1);
select * from mobile_br.pacoteaquisicao where idpacoteaquisicao=(select idPacoteAquisicao from mobile_br.pacoteaquisicao order by 1 desc limit 1);

/* rodando cancelamento st_pacoteaquisicao=>0 */
select * from mobile_br.pacoteaquisicao order by 1 desc;
update mobile_br.licenca set dt_cancelamento='2013-10-10 00:00:00.000',dt_termino='2012-10-10 00:00:00.000' where idPacoteAquisicao='2240';
select * from mobile_br.pacoteaquisicao  where idClienteFone=466;


/* trocar status de cancelamento manualmente */
update mobile_br.pacoteaquisicao set dt_cancelamento='2013-10-10 00:00:00.000', st_pacoteaquisicao='1' where ds_email='553050716829@tss.com';
update mobile_br.licenca         set st_licenca='3' where ds_licenca='555284001004';
update mobile_br.pacoteaquisicao set dt_cancelamento='2013-10-10 00:00:00.000', st_pacoteaquisicao='3' where ds_email='553050716829@tss.com';
select * from mobile_br.licenca where idpacoteaquisicao='2332';


553400036295@tss.com
557466690188

/* trazer usuarios para teste de cancelamento */
-- select          pacoteaquisicao.*
select          clientefone.*
-- select          usuario.*
-- select          pacoteaquisicao.idPacoteAquisicao,clientefone.ds_fone,pacoteaquisicao.ds_email,pacoteaquisicao.ds_senha,pacoteaquisicao.st_pacoteaquisicao
select          clientefone.ds_fone
from            mobile_br.pacoteaquisicao 
join            mobile_br.clientefone on (pacoteaquisicao.idClienteFone = clientefone.idClienteFone) 
inner join      mobile_br.cliente     on (clientefone.idCliente = cliente.idCliente) 
inner join      mobile_br.usuario     on (pacoteaquisicao.ds_email = usuario.ds_login) 
-- inner join      mobile_br.perfil      on (usuario.idPerfil = perfil.idPerfil)
inner join      mobile_br.pacote      on (pacoteaquisicao.idPacoteConfigura = pacote.idPacote)
-- ;
where           clientefone.ds_fone in (553400036295);
-- group by pacote.idPacote;
-- where           pacoteaquisicao.st_pacoteaquisicao in (1) and pacote.idPacote=2;
where           pacoteaquisicao.st_pacoteaquisicao in (1);
-- and           pacoteaquisicao.ds_email='554740925832@tss.com';
limit 1;

tssb_20110701@ig.com
5teste2_brasil@1434515491.com

5018970477 => 123456
4740925832 => 123456
5977693796 => 123456
4954975156 => 123456
5974213133 => 123456
8278196727 => 123456
6373920142 => 123456
7709704931 => 123456
7972685015 => 123456

/* teste no call center */
http://homolog2.titanssolutions.net/tssmobile_brasil/auth/login
callcenter@tss.com
admin

554954975156
555974213133
558278196727
556373920142
557709704931
554114446718



update          tss_brasil.pacoteaquisicao 
set             ds_senha='MTIzNDU2' 
where           idPacoteAquisicao in (
    160321,
    160411,
    160579,
    160580,
    160584,
    160586,
    160600
);


update          tss_brasil.pacoteaquisicao 
set             ds_senha='MTIzNDU2' 
where           ds_email in (
                    select          pacoteaquisicao.ds_email
                    from            tss_brasil.pacoteaquisicao 
                    join            tss_brasil.clientefone on (pacoteaquisicao.idClienteFone = clientefone.idClienteFone) 
                    inner join      tss_brasil.cliente     on (clientefone.idCliente = cliente.idCliente) 
                    inner join      tss_brasil.usuario     on (pacoteaquisicao.ds_email = usuario.ds_login) 
                    inner join      tss_brasil.pacote      on (pacoteaquisicao.idPacoteConfigura = pacote.idPacote)
                    where           clientefone.ds_fone in (3667787698,1434515491,8823452345,2323567899,1183095580,1026082011,6786789999)
        );


MTIzNDU2 => 123456
3400036295
5977693796
6978235542

testeclarobr@sharklasers.com
database.adapter		 = "pdo_mysql"
database.params.host   		 = "201.20.34.30"
database.params.username	 = "root"
database.params.password	 = "123456"
database.params.dbname 		 = "tss_brasil"

/* query de provisionamento para cancelamento */
SELECT `pacoteaquisicao`.* FROM `mobile_br`.`pacoteaquisicao` WHERE (st_pacoteaquisicao in (3,5,7))

/* habilitar usuarios para teste de cancelamento */

update mobile_br.usuario         set st_usuario     ='1',idperfil='6' where ds_login='553050716829@tss.com';
update mobile_br.licenca         set dt_cancelamento='',dt_termino='' where idlicenca='445' and idpacoteaquisicao='2191';

update mobile_br.pacoteaquisicao set dt_cancelamento=null, st_pacoteaquisicao='1' where ds_email='558563668748@tss.com';

/* usuarios para teste */
11989287249 => 12345a
527874873516@tss.com              => MTIzNDU2      => 123456
teste19091146@teste.com           => MTIzMTIzYg==  => 123123b
testecancelamento@sharklasers.com => MTIzNDU2      => 123456

/* query auth 1 */
select          pacoteaquisicao.ds_email,pacoteaquisicao.ds_senha
from            mobile_br.pacoteaquisicao 
join            mobile_br.clientefone       on ( clientefone.idClienteFone          = pacoteaquisicao.idClienteFone)
join            mobile_br.cliente	    on (clientefone.idCliente               = cliente.idCliente)
join            mobile_br.usuario	    on (cliente.idUsuario                   = usuario.idUsuario)
join            mobile_br.perfil	    on (usuario.idPerfil                    = perfil.idPerfil)
join            mobile_br.fabricante 	    on (pacoteaquisicao.idFabricante        = fabricante.idFabricante)
join            mobile_br.fabricantemodelo  on (pacoteaquisicao.idFabricanteModelo  = fabricantemodelo.idFabricanteModelo)
join            mobile_br.plataformamobile  on (fabricantemodelo.idPlataformaMobile = plataformamobile.idPlataformaMobile );

/* query auth 1 original */
select * from   mobile_br.pacoteaquisicao 
join            mobile_br.clientefone on ( clientefone.idClienteFone = pacoteaquisicao.idClienteFone)
join            mobile_br.cliente			on (clientefone.idCliente					= cliente.idCliente)
join            mobile_br.usuario			on (cliente.idUsuario 						= usuario.idUsuario)
join            mobile_br.perfil			on (usuario.idPerfil						= perfil.idPerfil)
join            mobile_br.fabricante 		on (pacoteaquisicao.idFabricante			= fabricante.idFabricante)
join            mobile_br.fabricantemodelo	on (pacoteaquisicao.idFabricanteModelo					= fabricantemodelo.idFabricanteModelo)
join            mobile_br.plataformamobile	on (fabricantemodelo.idPlataformaMobile 		= plataformamobile.idPlataformaMobile )
where (pacoteaquisicao.ds_email = '55553050716829' or clientefone.ds_fone = '55553050716829') and pacoteaquisicao.ds_senha = 'MTIzNDU2' and pacoteaquisicao.st_pacoteaquisicao in (1, 2 ,3) and usuario.st_usuario = 1 ;


/* query auth 2 */
select          pacoteaquisicao.ds_email,clientefone.ds_fone,pacoteaquisicao.ds_senha
from            mobile_br.pacoteaquisicao 
join            mobile_br.clientefone on (pacoteaquisicao.idClienteFone = clientefone.idClienteFone)
inner join      mobile_br.cliente			on (clientefone.idCliente					= cliente.idCliente)
inner join      mobile_br.usuario			on (pacoteaquisicao.ds_email						= usuario.ds_login)
inner join      mobile_br.perfil			on (usuario.idPerfil						= perfil.idPerfil)
where		pacoteaquisicao.st_pacoteaquisicao in (1, 2 ,3) and usuario.st_usuario = 1;

/* query auth 2 original */
select          * 
from            mobile_br.pacoteaquisicao 
join            mobile_br.clientefone on (pacoteaquisicao.idClienteFone = clientefone.idClienteFone)
inner join      mobile_br.cliente			on (clientefone.idCliente					= cliente.idCliente)
inner join      mobile_br.usuario			on (pacoteaquisicao.ds_email						= usuario.ds_login)
inner join      mobile_br.perfil			on (usuario.idPerfil						= perfil.idPerfil)
where (pacoteaquisicao.ds_email = '55553050716829' or clientefone.ds_fone = '55553050716829') and pacoteaquisicao.ds_senha = 'MTIzNDU2' and pacoteaquisicao.st_pacoteaquisicao in (1, 2 ,3) and usuario.st_usuario = 1 ;;


/* query debugger 1 */
select          * 
from            pacoteaquisicao 
join            clientefone on ( clientefone.idClienteFone = pacoteaquisicao.idClienteFone) 
join            cliente on (clientefone.idCliente = cliente.idCliente) 
join            usuario on (cliente.idUsuario = usuario.idUsuario) 
join            perfil on (usuario.idPerfil = perfil.idPerfil) 
join            fabricante on (pacoteaquisicao.idFabricante = fabricante.idFabricante) 
join            fabricantemodelo on (pacoteaquisicao.idFabricanteModelo = fabricantemodelo.idFabricanteModelo) 
join            plataformamobile on (fabricantemodelo.idPlataformaMobile = plataformamobile.idPlataformaMobile ) 
where (pacoteaquisicao.ds_email = '55553050716829' or clientefone.ds_fone = '55553050716829') and pacoteaquisicao.ds_senha = 'MTIzNDU2' and pacoteaquisicao.st_pacoteaquisicao in (1, 2 ,3) and usuario.st_usuario = 1 ;



select          * 
from            mobile_br.pacoteaquisicao 
join            mobile_br.clientefone on (pacoteaquisicao.idClienteFone = clientefone.idClienteFone) 
inner join      mobile_br.cliente on (clientefone.idCliente = cliente.idCliente) 
inner join      mobile_br.usuario on (pacoteaquisicao.ds_email = usuario.ds_login) 
inner join      mobile_br.perfil on (usuario.idPerfil = perfil.idPerfil) 
where           ( pacoteaquisicao.ds_email = '55553050716829' or clientefone.ds_fone = '55553050716829') 
and             pacoteaquisicao.ds_senha = 'MTIzNDU2' and pacoteaquisicao.st_pacoteaquisicao in (1, 2 ,3) and usuario.st_usuario = 1; 


/* usuario de testes no homolog2 */
11989287249 => 12345a

select * from mobile_br.pacoteaquisicao join mobile_br.clientefone on (pacoteaquisicao.idClienteFone = clientefone.idClienteFone) inner join mobile_br.cliente on (clientefone.idCliente = cliente.idCliente) inner join mobile_br.usuario on (pacoteaquisicao.ds_email = usuario.ds_login) inner join mobile_br.perfil on (usuario.idPerfil = perfil.idPerfil) where clientefone.ds_fone = '5511989722711'  and pacoteaquisicao.st_pacoteaquisicao in (1, 2 ,3) and usuario.st_usuario = 1 ;



update      mobile_br.pacoteaquisicao as pa,
            mobile_br.usuario         as us,
            mobile_br.licenca         as li
set         us.ds_login             ='1',
            pa.dt_cancelamento      = (select timestamp);

select current_timestamp;
SELECT INTERVAL 1 DAY + '2013-10-01';


select * from mobile_br.licenca where idpacoteaquisicao='2191';
select * from mobile_br.usuario;


teste2608@sharklasers.com => ale123456
2879767326                => 123456
5018970477                => 123456

select * from mobile_br.pacote;
select * from mobile_br.pacoteaquisicao;

select      pc.ds_pacote_detalhes
from        mobile_br.pacoteaquisicao as pa
inner join  mobile_br.pacote          as pc on pa.idPacoteConfigura = pc.idPacote
where       pa.idPacoteAquisicao = 10;

================================================================================
/* pendencias para cancelamento antivirus */
1-esta faltando informação no campo meus dados
a)numero claro===>true
b)status do pagamento(descer e trazer informação correta)===>true
c)formatar data de ativação===>true
d)testes===>true

2-teste do desativar pacote

3-upgrade
a)trazer o pacote atual do usuario===>true
b)saber identificar qual pacote se relaciona coma respecitva coluna do layout para coloca o botao "pacote atual"===>false
c)a ação de desativar botao, como funciona?===>false
d)depois de fazer funcionar os botões, fazer testes;===>false

================================================================================
