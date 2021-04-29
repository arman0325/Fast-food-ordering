/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ouhk.comps380f.service;

import java.io.IOException;
import java.util.List;
import ouhk.comps380f.model.Record;

/**
 *
 * @author arman
 */
public interface RecordService {
    
    public long createRecord(String userName, String orderList) throws IOException;
    
    public List<Record> getRecord();
    
    public Record getRecord(long id);
    
}
