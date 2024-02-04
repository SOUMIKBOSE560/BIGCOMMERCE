package net.demo.ecommerce.servicePackage;

import net.demo.ecommerce.models.User;
import net.demo.ecommerce.repositories.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.Optional;

@Service
public class UserService {

    @Autowired
    private UserRepository userRepository;

    public boolean saveUser(User user){
        try{
           userRepository.save(user);
           return true;
        }
        catch (Exception e){
            e.printStackTrace();
            return false;
        }
    }

   public List<User> getUsersByAddress(String address){

       System.out.println(userRepository.getAllUsersByAddress(address));
       return userRepository.getAllUsersByAddress(address);
   }

   public List<User> getUsersByName(String name){
        List<User> userList = new ArrayList<>();
       userList = userRepository.fetchUsers(name);
        return userList;
   }

   public String deleteAllUser(){

        try{
            userRepository.deleteAll();
            return "All users deleted !!";
        }catch (Exception e){
            return "Error occurred";
        }
   }

   public User getUserById(int id){
        Optional<User> user = userRepository.findById(id);

        if (user.isPresent()){
            return user.get();
        }

        return null;
   }
}
