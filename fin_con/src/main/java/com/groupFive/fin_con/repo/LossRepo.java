package com.groupFive.fin_con.repo;

import com.groupFive.fin_con.domain.Loss;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface LossRepo extends JpaRepository<Loss, Long> {
    List<Loss> findByUserId(String id);

}
