/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controllers.util;

import javax.servlet.http.HttpSession;

/**
 *
 * @author Thanh Duoc
 */
public class SessionUtil {

    public static void clearMessages(HttpSession session) {
        session.removeAttribute("message");
        session.removeAttribute("messageType");
    }
}

