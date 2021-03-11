/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package services;
import models.User;
import dataaccess.UserDB;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

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
    
    public boolean updateUser(String email, String firstName, String lastName, String password, int role, int active) {
        User user = new User(email, firstName, lastName, password, active, role);
        UserDB userDB = new UserDB();
        try {
            userDB.insert(user);
            return true;
        } catch (Exception ex) {
            Logger.getLogger(UserServices.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }
    
    public boolean addUser(String email, String firstName, String lastName, String password, int role, int active){
        List<User> users = getAllUsers();
        UserDB userDB;
        User user;
        
        for (User userToCheck : users) {
            if (userToCheck.getEmail().equals(email)) {
                return false;
            } else {
                userDB = new UserDB();
                user = new User(email, firstName, lastName, password, active, role);
                try {
                    userDB.insert(user);
                } catch (Exception ex) {
                    Logger.getLogger(UserServices.class.getName()).log(Level.SEVERE, null, ex);
                }
                return true; 
            }
        }
        return false;
    }
    
    public boolean deleteUser(String email) {
        return false;
    }
    
    public List<User> getAllUsers(){
        UserDB userDB = new UserDB();
        List<User> users;
        try {
            users = userDB.getAll();
            return users;
        } catch (Exception ex) {
            Logger.getLogger(UserServices.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
    
}
