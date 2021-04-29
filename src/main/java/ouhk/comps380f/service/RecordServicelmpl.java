/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ouhk.comps380f.service;

import java.io.IOException;
import java.util.List;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import ouhk.comps380f.dao.RecordRepository;
import ouhk.comps380f.model.Record;

/**
 *
 * @author arman
 */
@Service
public class RecordServicelmpl implements RecordService{
    
    @Resource
    private RecordRepository recordRepo;

    @Override
    @Transactional
    public long createRecord(String userName, String orderList) throws IOException {
        Record record = new Record();
        record.setUserName(userName);
        record.setOrderlist(orderList);
        Record savedRecord = recordRepo.save(record);
        return savedRecord.getId();
    }

    @Override
    @Transactional
    public List<Record> getRecord() {
        return recordRepo.findAll();
    }

    @Override
    @Transactional
    public Record getRecord(long id) {
        return recordRepo.findById(id).orElse(null);
    }
    
}
