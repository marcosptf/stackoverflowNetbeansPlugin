/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package org.stackoverflow;

/**
 * @Author:marcosptf@yahoo.com.br
 * @site:javascripterninja.com.br
 * @since:22/05/2013
 * Yahoo! Search Developer
 */

import java.net.URL;
import java.net.URLEncoder;
import org.openide.awt.HtmlBrowser;


/**
 *
 * @author marcosptfNetbeans
 */
public class StackPanel extends javax.swing.JPanel {

    private javax.swing.JLabel      jLabelYahoo;
    private javax.swing.JTextField  jTextFieldYahoo;    
    private String                  strUrl            = "http://br.search.yahoo.com/search?p=";
    private String                  strLabelValue     = "Pesquisa Y!Search";
    private String                  strTextFieldValue = "Digite o termo de busca...";
    
    /**
     * Creates new form YahooPainel
     */
    public StackPanel() {
        initComponent();
    }


    private void initComponent(){
        jLabelYahoo     = new javax.swing.JLabel();
        jTextFieldYahoo = new javax.swing.JTextField();
        jLabelYahoo.setName("jLabelYahoo"); // NOI18N
        jLabelYahoo.setText("StackOverflow");
        jTextFieldYahoo.addActionListener(new java.awt.event.ActionListener() {
            @Override
            public void actionPerformed(java.awt.event.ActionEvent evt){
                jTextFieldYahooActionPerformed(evt);
            }
            
            
        });        

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(this);
        this.setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING,true)
                .addGroup(
                layout.createSequentialGroup()
                .addContainerGap()
                .addComponent(jLabelYahoo, javax.swing.GroupLayout.PREFERRED_SIZE,85, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED,16, Short.MAX_VALUE)
                .addComponent(jTextFieldYahoo, javax.swing.GroupLayout.PREFERRED_SIZE,200, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addContainerGap()
                )
        );
        /*layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING,true)
            .addGroup(layout.createSequentialGroup()
                .addContainerGap()
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                .addComponent(jTextFieldYahoo,15,25,25)
                .addComponent(jLabelYahoo))
                .addContainerGap())
        );*/        

     }

    private void jTextFieldYahooActionPerformed(java.awt.event.ActionEvent evt) {
        try {
            String   searchText   = URLEncoder.encode(jTextFieldYahoo.getText(), "UTF-8");
            strUrl="http://stackoverflow.com/search?q="+searchText;
            HtmlBrowser.URLDisplayer.getDefault().showURL(
                        new URL(strUrl)
                    );
        } catch (Exception err){
            err.getMessage();//nothing much to do
        }

    }
   

    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">                          
    private void initComponents() {

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(this);
        this.setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGap(0, 400, Short.MAX_VALUE)
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGap(0, 300, Short.MAX_VALUE)
        );
    }// </editor-fold>                        
    // Variables declaration - do not modify                     
    // End of variables declaration                   
}
