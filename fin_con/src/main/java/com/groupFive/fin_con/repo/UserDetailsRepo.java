package com.groupFive.fin_con.repo;

import com.groupFive.fin_con.domain.User;
import org.springframework.data.jpa.repository.JpaRepository;

public interface UserDetailsRepo extends JpaRepository<User, String> {
}