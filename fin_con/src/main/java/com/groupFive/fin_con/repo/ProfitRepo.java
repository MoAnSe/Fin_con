package com.groupFive.fin_con.repo;

import com.groupFive.fin_con.domain.Profit;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface ProfitRepo extends JpaRepository<Profit, Long> {
    List<Profit> findByUserId(String id);
}
