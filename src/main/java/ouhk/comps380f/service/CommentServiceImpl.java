package ouhk.comps380f.service;

import java.io.IOException;
import java.util.List;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import ouhk.comps380f.dao.CommentRepository;
import ouhk.comps380f.model.Comment;

@Service
public class CommentServiceImpl implements CommentService {

    @Resource
    private CommentRepository commentRepo;
    
    @Override
    @Transactional
    public List<Comment> getCommentByFoodId(long foodId) {
        return commentRepo.findByFoodId(foodId);
    }
    
    @Override
    @Transactional
    public void addComment(Comment comment) {
        commentRepo.save(comment);
    }
    
    @Override
    @Transactional
    public void deleteComment(long id) {
        commentRepo.deleteById(id);
    }
}

