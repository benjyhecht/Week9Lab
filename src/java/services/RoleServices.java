/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package services;

import java.util.List;
import models.Role;
import dataaccess.RoleDB;

/**
 *
 * @author 468181
 */
public class RoleServices {
    
    public RoleServices() {
        
    }
    
    public List<String> getAllRoles(){
        
        RoleDB roleDB = new RoleDB();
        //return roleDB.getAll();
        return null;
    }
    
}
