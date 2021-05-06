package ouhk.comps380f.controller;

import java.io.IOException;
import java.security.Principal;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Hashtable;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;
import ouhk.comps380f.model.Comment;
import ouhk.comps380f.model.Food;
import ouhk.comps380f.database.DatabaseOperation;
import ouhk.comps380f.exception.FoodNotFound;
import ouhk.comps380f.service.AttachmentService;
import ouhk.comps380f.service.CommentService;
import ouhk.comps380f.service.FoodService;
import ouhk.comps380f.service.RecordService;

@Controller
@RequestMapping("/menu")
public class MenuController {

    @Autowired
    private RecordService recordService;

    @Autowired
    private FoodService foodService;

    @Autowired
    private AttachmentService attachmentService;

    @Autowired
    private CommentService commentService;

    DatabaseOperation dbOperation = new DatabaseOperation();
    private Map<String, Food> menuDatabase = new Hashtable<>();
    //private Map<String, Comment> commentDatabase = new Hashtable<>();

    private Map<String, Integer> cart = new Hashtable<>(); //For save the cart of user

    @GetMapping(value = {"", "/list"})
    public String list(ModelMap model) {
        model.addAttribute("menuDatabase", foodService.getFoods());
        return "list";
    }

    @GetMapping("/create")
    public ModelAndView create(HttpServletRequest request) {
        if (!request.isUserInRole("ROLE_ADMIN")) {
            return new ModelAndView("list", "menuDatabase", foodService.getFoods());
        }
        return new ModelAndView("add", "foodForm", new FoodForm());
    }

    @PostMapping("/create")
    public String create(FoodForm form, Principal principal) throws IOException {
        long foodId = foodService.createFood(form.getFoodName(),
                form.getDescription(), form.getPrice(), form.isAvailability(),
                form.getAttachments());
        return "redirect:/menu/view/" + foodId;
    }

    public static class CommentForm {

        private String name;
        private long id;
        private String body;

        public String getName() {
            return name;
        }

        public void setName(String name) {
            this.name = name;
        }

        public long getId() {
            return id;
        }

        public void setId(long id) {
            this.id = id;
        }

        public String getBody() {
            return body;
        }

        public void setBody(String body) {
            this.body = body;
        }
    }

    public static class FoodForm {

        private String foodName;
        private String description;
        private double price;
        private boolean availability;
        private List<MultipartFile> attachments;

        public String getFoodName() {
            return foodName;
        }

        public void setFoodName(String foodName) {
            this.foodName = foodName;
        }

        public String getDescription() {
            return description;
        }

        public void setDescription(String description) {
            this.description = description;
        }

        public double getPrice() {
            return price;
        }

        public void setPrice(double price) {
            this.price = price;
        }

        public boolean isAvailability() {
            return availability;
        }

        public void setAvailability(boolean availability) {
            this.availability = availability;
        }

        public List<MultipartFile> getAttachments() {
            return attachments;
        }

        public void setAttachments(List<MultipartFile> attachments) {
            this.attachments = attachments;
        }
    }

    @GetMapping("/view/{foodId}")
    public String view(@PathVariable("foodId") long foodId,
            ModelMap model) {
        Food item = foodService.getFood(foodId);
        if (item == null) {
            return "redirect:/menu/list";
        }

        model.addAttribute("foodId", foodId);
        model.addAttribute("food", item);
        model.addAttribute("commentForm", new CommentForm());
        model.addAttribute("commentDatabase", commentService.getCommentByFoodId(foodId));
        return "view";
    }

    @PostMapping("/view/{foodId}")
    public String view(CommentForm form, @PathVariable("foodId") long foodId,
            Principal principal) throws IOException, FoodNotFound {
        String timestamp = new SimpleDateFormat("yyyy.MM.dd.HH.mm.ss").format(new Date());
        System.out.println(timestamp);
        System.out.println(form.getId());
        Comment comment = new Comment();
        comment.setTimestamp(timestamp);
        comment.setUserName(principal.getName());
        comment.setContents(form.getBody());
        comment.setFoodId(foodId);

        commentService.addComment(comment);
        return "redirect:/menu/view/" + foodId;
    }

    @GetMapping("/view/{foodId}/delete/{commentId}")
    public String delete(Principal principal,
            @PathVariable("foodId") long foodId,
            @PathVariable("commentId") long commentId)
            throws IOException, FoodNotFound {
        commentService.deleteComment(commentId);
        return "redirect:/menu/view/" + foodId;
    }

    @GetMapping("/cart")
    public ModelAndView create(ModelMap model, HttpServletRequest request) {

        HttpSession session = request.getSession();
        if (session.getAttribute("cart") == null) {
            session.setAttribute("cart", new Hashtable<>());
        }
        Map<String, Integer> cart = (Map<String, Integer>) session.getAttribute("cart");
        model.addAttribute("UserCart", cart);
        return new ModelAndView("cart", "recordForm", new Form());
    }

    public static class Form {

        private String order;

        public String getOrder() {
            return order;
        }

        public void setOrder(String order) {
            this.order = order;
        }
    }

    public static class AvailabilityForm {

        private boolean availability;

        public boolean getAvailability() {
            return availability;
        }

        public void setAvailability(boolean availability) {
            this.availability = availability;
        }
    }

    @PostMapping("/cart")
    public String create(Form form, Principal principal, HttpServletRequest request) throws IOException {
        HttpSession session = request.getSession();
        if (session.getAttribute("cart") == null) {
            session.setAttribute("cart", new Hashtable<>());
        }
        Map<String, Integer> cart = (Map<String, Integer>) session.getAttribute("cart");
        long recordId = recordService.createRecord(principal.getName(), form.getOrder());
        cart.clear();
        return "redirect:/user/recordList";
    }

    @GetMapping("/addToCart/{foodId}")
    public String addToCart(@PathVariable("foodId") String foodId,
            ModelMap model, HttpServletRequest request) throws IOException {
        String name="";
        List<Food> food = new ArrayList<Food>();
        food = foodService.getFoods();
        for (Food f:food){
            if(Long.toString(f.getId()).equals(foodId)){
                name = f.getFoodName();
            }
        }
        HttpSession session = request.getSession();
        if (session.getAttribute("cart") == null) {
            session.setAttribute("cart", new Hashtable<>());
        }
        Map<String, Integer> cart = (Map<String, Integer>) session.getAttribute("cart");

        if (!cart.containsKey(name)) {
            cart.put(name, 0);

        }

        cart.put(name, cart.get(name) + 1);

        return "redirect:/menu/cart";

    }

    @GetMapping("/delete/{foodId}")
    public String delete(@PathVariable("foodId") long foodId,
            ModelMap model, HttpServletRequest request) throws IOException, FoodNotFound {
        if (!request.isUserInRole("ROLE_ADMIN")) {
            return "redirect:/menu/list";
        }
        foodService.delete(foodId);
        return "redirect:/menu/list";
    }

    @GetMapping("/availability/{foodId}")
    public ModelAndView showEdit(@PathVariable("foodId") long foodId,
            Principal principal, HttpServletRequest request) {
        Food food = foodService.getFood(foodId);
        if (!request.isUserInRole("ROLE_ADMIN")) {
            return new ModelAndView(new RedirectView("/menu/list", true));
        }

        ModelAndView modelAndView = new ModelAndView("setAvailability");
        modelAndView.addObject("food", food);

        AvailabilityForm availabilityForm = new AvailabilityForm();
        modelAndView.addObject("availabilityForm", availabilityForm);

        return modelAndView;
    }

    @PostMapping("/availability/{foodId}")
    public String edit(@PathVariable("foodId") long foodId, AvailabilityForm form,
            Principal principal, HttpServletRequest request)
            throws IOException, FoodNotFound {
        Food food = foodService.getFood(foodId);
        if (food == null || (!request.isUserInRole("ROLE_ADMIN"))) {
            return "redirect:/menu/list";
        }

        foodService.changeAvailability(foodId, form.getAvailability());
        return "redirect:/menu/view/" + foodId;
    }
}
