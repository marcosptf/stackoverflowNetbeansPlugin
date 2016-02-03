/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.stackoverflow;

import java.awt.Component;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import javax.swing.AbstractAction;
import org.openide.awt.ActionID;
import org.openide.awt.ActionReference;
import org.openide.awt.ActionReferences;
import org.openide.awt.ActionRegistration;
import org.openide.util.NbBundle.Messages;
import org.openide.util.actions.Presenter;

@ActionID(
        category = "File",
        id = "com.stackoverflow.StackOverflowActionListener"
)
@ActionRegistration(
        //        iconBase = "com/stackoverflow/stackoverflow.png",
        //        displayName = "#CTL_StackOverflowActionListener"
        lazy = false,
        displayName = "NOT-USED"
)
@ActionReferences({
    @ActionReference(path = "Toolbars/File", position = 0),
    @ActionReference(path = "Shortcuts", name = "DOS-S")
})
@Messages("CTL_StackOverflowActionListener=StackOverflow")
public final class StackOverflowActionListener extends AbstractAction implements Presenter.Toolbar {

    @Override
    public Component getToolbarPresenter() {
        // TODO implement action body
        return new StackOverflowPanel();
    }

    @Override
    public void actionPerformed(ActionEvent e) {
        // TODO implement action body
    }
}
