package ouhk.comps380f.controller;

import java.io.IOException;
import java.security.Principal;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Hashtable;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.datasource.DriverManagerDataSource;
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
import ouhk.comps380f.database.DatabaseOperation;

@Controller
@RequestMapping("/menu")
public class MenuController {
    DatabaseOperation dbOperation = new DatabaseOperation();
    private Map<String, Food> menuDatabase = new Hashtable<>();
    //private Map<String, Comment> commentDatabase = new Hashtable<>();
    
    private Map<String, Integer> cart = new Hashtable<>(); //For save the cart of user
    

    @GetMapping(value = {"", "/list"})
    public String list(ModelMap model) {
        Food item1 = new Food();
        item1.setId("1");
        item1.setFoodName("Hamburger");
        item1.setDescription("A hamburger with cheese.");
        item1.setPrice(20);
        item1.setAvailability(true);
        
        Food item2 = new Food();
        item2.setId("2");
        item2.setFoodName("Fish and Chips");
        item2.setDescription("A delicious Fish and Chips.");
        item2.setPrice(25.5);
        item2.setAvailability(true);
        
        menuDatabase.put(item2.getId(), item2);
        menuDatabase.put(item1.getId(), item1);
        
        model.addAttribute("menuDatabase", menuDatabase);
        return "list";
    }
    
    public static class CommentForm {

        private String name;
        private String id;
        private String body;
        private List<MultipartFile> attachments;
        
        public String getName() {
            return name;
        }

        public void setName(String name) {
            this.name = name;
        }
        
        public String getId() {
            return id;
        }

        public void setId(String id) {
            this.id = id;
        }

        public String getBody() {
            return body;
        }

        public void setBody(String body) {
            this.body = body;
        }

        public List<MultipartFile> getAttachments() {
            return attachments;
        }

        public void setAttachments(List<MultipartFile> attachments) {
            this.attachments = attachments;
        }
    }
    
    @GetMapping("/view/{foodId}")
    public String view(@PathVariable("foodId") String foodId,
            ModelMap model) {
        Food item = this.menuDatabase.get(foodId);
        if (item == null) {
            return "redirect:/menu/list";
        }
        model.addAttribute("foodId", foodId);
        model.addAttribute("food", item);
        model.addAttribute("commentForm", new CommentForm());
        model.addAttribute("commentDatabase", dbOperation.getCommentList(foodId));
        return "view";
    }
    
    @PostMapping("/view/{foodId}")
    public String create(CommentForm form, Principal principal) throws IOException {
        String commentId = new SimpleDateFormat("yyyy.MM.dd.HH.mm.ss").format(new Date());
        commentId = principal.getName() + commentId;
        Comment comment = new Comment();
        comment.setCommentId(commentId);
        comment.setUserName(principal.getName());
        comment.setContents(form.getBody());
        comment.setItemId(form.getId());
        
        dbOperation.addComment(comment);
        //this.commentDatabase.put(commentId, comment);
        return "redirect:/menu/view/" + form.getId();
    }
    
    @GetMapping("/cart")
    public ModelAndView create(ModelMap model) {
        Map<String, String> foodMenu = new Hashtable<>();
        for (String key: menuDatabase.keySet()){
            foodMenu.put(key, menuDatabase.get(key).getFoodName());
        }
        
        model.addAttribute("foodMenu", foodMenu);
        model.addAttribute("UserCart", this.cart);
        return new ModelAndView("cart");
    }
    
    @GetMapping("/addToCart/{foodId}")
    public String addToCart(@PathVariable("foodId") String foodId,
            ModelMap model) throws IOException {
        Food item = this.menuDatabase.get(foodId);
        if (!cart.containsKey(foodId)){
            cart.put(foodId, 0);
        }
        cart.put(foodId, cart.get(foodId)+1);
        return "redirect:/menu/cart";
    }
}
