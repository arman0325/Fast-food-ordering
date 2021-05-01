package ouhk.comps380f.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import ouhk.comps380f.model.Food;

public interface FoodRepository extends JpaRepository<Food, Long> {
}
