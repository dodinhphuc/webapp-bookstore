package com.webapp.dao;

import java.util.List;

import com.webapp.model.BookModel;

public interface IBookDAO {
	BookModel findOne(Long id);
	List<BookModel> findByType(Long id);
	Long save(BookModel bookModel);
	void update(BookModel bookModel);
	void delete(long id);
	List<BookModel> findAll();
	List<BookModel> findByConditions(Long typeId);
	int getTotalItem();
	List<BookModel> findAll(Integer offset, Integer limit);
}
