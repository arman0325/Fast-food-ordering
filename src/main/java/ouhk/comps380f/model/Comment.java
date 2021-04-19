package ouhk.comps380f.model;

import java.io.Serializable;

public class Comment implements Serializable {
    private String userName;
    private String contents;

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getContents() {
        return contents;
    }

    public void setContents(String contents) {
        this.contents = contents;
    }
}
