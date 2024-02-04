package net.demo.ecommerce.repositories;

import net.demo.ecommerce.models.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

//Repository or DAO
@Repository
public interface UserRepository extends JpaRepository<User,Integer> {

    @Query(value = "SELECT * FROM ecommerce.user u WHERE u.address=:address",nativeQuery = true)
    List<User> getAllUsersByAddress(String address);

    @Query(value = "SELECT * FROM ecommerce.user u WHERE CONCAT(u.firstname,' ',u.lastname)=:username",nativeQuery = true)
    List<User> fetchUsers(String username);
}
