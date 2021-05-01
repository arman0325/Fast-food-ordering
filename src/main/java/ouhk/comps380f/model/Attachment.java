package ouhk.comps380f.model;

import java.io.Serializable;
import java.util.Base64;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;
import org.springframework.context.annotation.Bean;

@Entity
public class Attachment implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;

    @Column(name = "filename")
    private String name;

    @Column(name = "content_type")
    private String mimeContentType;

    @Column(name = "content")
    @Basic(fetch = FetchType.EAGER)
    @Lob
    private byte[] contents;

    @Column(name = "food_id", insertable = false, updatable = false)
    private long foodId;

    @ManyToOne
    @JoinColumn(name = "food_id")
    private Food food;

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getMimeContentType() {
        return mimeContentType;
    }

    public void setMimeContentType(String mimeContentType) {
        this.mimeContentType = mimeContentType;
    }

    public byte[] getContents() {
        System.out.println(contents);
        return contents;
    }

    public void setContents(byte[] contents) {
        System.out.println(contents);
        this.contents = contents;
    }

    public long getFoodId() {
        return foodId;
    }

    public void setFoodId(long foodId) {
        this.foodId = foodId;
    }

    public Food getFood() {
        return food;
    }

    public void setFood(Food food) {
        this.food = food;
    }

    @Bean
    public String getByteArrayString() {
        return Base64.getEncoder().encodeToString(contents);
    }
}
