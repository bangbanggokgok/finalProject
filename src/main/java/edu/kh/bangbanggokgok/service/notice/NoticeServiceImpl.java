package edu.kh.bangbanggokgok.service.notice;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.kh.bangbanggokgok.dao.notice.NoticeDAO;

@Service
public class NoticeServiceImpl implements NoticeService{

	@Autowired
	private NoticeDAO dao;
}
