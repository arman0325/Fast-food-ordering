/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ouhk.comps380f.model;

import java.io.Serializable;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 *
 * @author arman
 */
@Entity
@Table(name = "records")
public class Record implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long order_id;

    @Column(name = "username")
    private String userName;

    @Column(name = "orderlist")
    private String orderlist;
    
    @Column(name = "orderdate")
    private String orderdate;

    public long getId() {
        return order_id;
    }

    public void setId(long id) {
        this.order_id = id;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getOrderlist() {
        return orderlist;
    }

    public void setOrderlist(String orderlist) {
        this.orderlist = orderlist;
    }

    public String getOrderdate() {
        return orderdate;
    }

    public void setOrderdate(String orderdate) {
        this.orderdate = orderdate;
    }


}
