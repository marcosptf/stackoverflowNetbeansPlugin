/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package org.stackoverflow;

import java.awt.Component;
import java.awt.event.ActionEvent;
import javax.swing.AbstractAction;
import org.openide.awt.ActionID;
import org.openide.awt.ActionReference;
import org.openide.awt.ActionRegistration;
import org.openide.util.NbBundle.Messages;
import org.openide.util.actions.Presenter;

/**
 * @Author:marcosptf@netbeans.org
 * @site:github.com/marcosptf
 * @since:11/08/2015
 * stackoverflow
 */



@ActionID(
        category = "File",
        id = "br.search.yahoo.YahooActionListener")
@ActionRegistration(
        lazy = false,
        displayName = "NOT-USED")
@ActionReference(
        path = "Toolbars/Stackoverflow",
        position = 0)

public final class StackActionListener extends AbstractAction implements Presenter.Toolbar {

    @Override
    public Component getToolbarPresenter() {
        // TODO implement action body
        return new StackPanel();
    }    
    @Override
    public void actionPerformed(ActionEvent e) {
        // TODO implement action body
    }
}