package ouhk.comps380f.service;

import java.util.List;
import ouhk.comps380f.model.Comment;

public interface CommentService {

    public List<Comment> getCommentByFoodId(long foodId);
    
    public void addComment(Comment comment);
    
    public void deleteComment(long id);
}

