package ouhk.comps380f.service;

import java.io.IOException;
import java.util.List;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;
import ouhk.comps380f.dao.AttachmentRepository;
import ouhk.comps380f.dao.FoodRepository;
import ouhk.comps380f.exception.AttachmentNotFound;
import ouhk.comps380f.exception.FoodNotFound;
import ouhk.comps380f.model.Attachment;
import ouhk.comps380f.model.Food;

@Service
public class FoodServicelmpl implements FoodService {
    
    @Resource
    private FoodRepository foodRepo;

    @Resource
    private AttachmentRepository attachmentRepo;

    @Override
    @Transactional
    public List<Food> getFoods() {
        return foodRepo.findAll();
    }

    @Override
    @Transactional
    public Food getFood(long id) {
        return foodRepo.findById(id).orElse(null);
    }

    @Override
    @Transactional(rollbackFor = FoodNotFound.class)
    public void delete(long id) throws FoodNotFound {
        Food deletedFood = foodRepo.findById(id).orElse(null);
        if (deletedFood == null) {
            throw new FoodNotFound();
        }
        foodRepo.delete(deletedFood);
    }

    @Override
    @Transactional(rollbackFor = AttachmentNotFound.class)
    public void deleteAttachment(long foodId, String name) throws AttachmentNotFound {
        Food food = foodRepo.findById(foodId).orElse(null);
        for (Attachment attachment : food.getAttachments()) {
            if (attachment.getName().equals(name)) {
                food.deleteAttachment(attachment);
                foodRepo.save(food);
                return;
            }
        }
        throw new AttachmentNotFound();
    }

    @Override
    @Transactional
    public long createFood(String foodName, String description,
            double price, boolean availability, List<MultipartFile> attachments) throws IOException {
        Food food = new Food();
        food.setFoodName(foodName);
        food.setDescription(description);
        food.setPrice(price);
        food.setAvailability(availability);

        for (MultipartFile filePart : attachments) {
            Attachment attachment = new Attachment();
            attachment.setName(filePart.getOriginalFilename());
            attachment.setMimeContentType(filePart.getContentType());
            attachment.setContents(filePart.getBytes());
            attachment.setFood(food);
            if (attachment.getName() != null && attachment.getName().length() > 0
                    && attachment.getContents() != null
                    && attachment.getContents().length > 0) {
                food.getAttachments().add(attachment);
            }
        }
        Food savedFood = foodRepo.save(food);
        return savedFood.getId();
    }

    @Override
    @Transactional(rollbackFor = FoodNotFound.class)
    public void updateFood(long id, String foodName, String description,
            double price, boolean availability, List<MultipartFile> attachments)
            throws IOException, FoodNotFound {
        Food updatedFood = foodRepo.findById(id).orElse(null);
        if (updatedFood == null) {
            throw new FoodNotFound();
        }

        updatedFood.setFoodName(foodName);
        updatedFood.setDescription(description);
        updatedFood.setPrice(price);
        updatedFood.setAvailability(availability);

        for (MultipartFile filePart : attachments) {
            Attachment attachment = new Attachment();
            attachment.setName(filePart.getOriginalFilename());
            attachment.setMimeContentType(filePart.getContentType());
            attachment.setContents(filePart.getBytes());
            attachment.setFood(updatedFood);
            if (attachment.getName() != null && attachment.getName().length() > 0
                    && attachment.getContents() != null
                    && attachment.getContents().length > 0) {
                updatedFood.getAttachments().add(attachment);
            }
        }
        foodRepo.save(updatedFood);
    }
    
    @Override
    @Transactional(rollbackFor = FoodNotFound.class)
    public void changeAvailability(long id, boolean availability)
            throws IOException, FoodNotFound {
        Food updatedFood = foodRepo.findById(id).orElse(null);
        if (updatedFood == null) {
            throw new FoodNotFound();
        }

        updatedFood.setAvailability(availability);

        foodRepo.save(updatedFood);
    }
}
