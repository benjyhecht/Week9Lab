/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package services;
import models.User;
import dataaccess.UserDB;
import java.util.List;

/**
 *
 * @author Diego Weidle Rost
 */
public class UserServices {
    
    public User getUser(String email) throws Exception {
        UserDB userDB = new UserDB();
        User user = userDB.getUser(email);
        
        // return a note only if the owner of that note is the email address
        if (user.getEmail().equals(email)) {
            return user;
        } else {
            return null;
        }    
    }
    
    public List<User> getAllUsers(){
        
        return null;
    }
    
}
