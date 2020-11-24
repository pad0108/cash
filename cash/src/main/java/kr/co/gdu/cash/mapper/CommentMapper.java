package kr.co.gdu.cash.mapper;

import org.apache.ibatis.annotations.Mapper;

import kr.co.gdu.cash.vo.Comment;



@Mapper
public interface CommentMapper {
	int insertComment(Comment comment);
	int deleteComment(int commentId);
}
