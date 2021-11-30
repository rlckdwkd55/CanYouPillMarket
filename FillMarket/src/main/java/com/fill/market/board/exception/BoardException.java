package com.fill.market.board.exception;

public class BoardException extends RuntimeException {
	/**
	 * 
	 */
	private static final long serialVersionUID = 13L;

	public BoardException() { }
	
	public BoardException(String msg) {
		super("[게시글 서비스] :" + msg);
	}
}
