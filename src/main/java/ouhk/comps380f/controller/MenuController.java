package ouhk.comps380f.controller;

import java.io.IOException;
import java.util.Hashtable;
import java.util.List;
import java.util.Map;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.View;
import org.springframework.web.servlet.view.RedirectView;
import ouhk.comps380f.model.Attachment;
import ouhk.comps380f.model.Comment;
import ouhk.comps380f.model.Food;

@Controller
@RequestMapping("/menu")
public class MenuController {

    private volatile long ITEM_ID_SEQUENCE = 1;
    private Map<Long, Food> menuDatabase = new Hashtable<>();

    @GetMapping(value = {"", "/list"})
    public String list(ModelMap model) {
        Food item1 = new Food();
        item1.setId(1);
        item1.setFoodName("Hamburger");
        item1.setDescription("A hamburger with cheese.");
        item1.setPrice(20);
        item1.setAvailability(true);
        
        Food item2 = new Food();
        item2.setId(2);
        item2.setFoodName("Fish and Chips");
        item2.setDescription("A delicious Fish and Chips.");
        item2.setPrice(25.5);
        item2.setAvailability(true);
        
        menuDatabase.put(item2.getId(), item2);
        menuDatabase.put(item1.getId(), item1);
        
        model.addAttribute("menuDatabase", menuDatabase);
        return "list";
    }
    
    @GetMapping("/view/{foodId}")
    public String view(@PathVariable("foodId") long foodId,
            ModelMap model) {
        Food item = this.menuDatabase.get(foodId);
        if (item == null) {
            return "redirect:/menu/list";
        }
        model.addAttribute("foodId", foodId);
        model.addAttribute("food", item);
        return "view";
    }
}
