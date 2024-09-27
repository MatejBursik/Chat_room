package com.api.chat_room.repository;

import com.api.chat_room.model.CanAccess;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface CanAccessRepository extends JpaRepository<CanAccess, Long> {
}
