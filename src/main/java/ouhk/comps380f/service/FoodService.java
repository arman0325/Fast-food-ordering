package ouhk.comps380f.service;

import java.io.IOException;
import java.util.List;
import org.springframework.web.multipart.MultipartFile;
import ouhk.comps380f.exception.AttachmentNotFound;
import ouhk.comps380f.exception.FoodNotFound;
import ouhk.comps380f.model.Food;

public interface FoodService {
    
    public long createFood(String foodName, String description,
            double price, boolean availability, List<MultipartFile> attachments) throws IOException;

    public List<Food> getFoods();

    public Food getFood(long id);

    public void updateFood(long id, String foodName, String description,
            double price, boolean availability, List<MultipartFile> attachments)
            throws IOException, FoodNotFound;

    public void delete(long id) throws FoodNotFound;

    public void deleteAttachment(long foodId, String name)
            throws AttachmentNotFound;
    
    public void changeAvailability(long id, boolean availability)
            throws IOException, FoodNotFound;
}
