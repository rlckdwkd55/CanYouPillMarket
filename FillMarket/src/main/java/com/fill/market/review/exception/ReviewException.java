package com.fill.market.review.exception;

public class ReviewException extends RuntimeException {
	/**
	 * 
	 */
	private static final long serialVersionUID = 133L;

	public ReviewException() { }
	
	public ReviewException(String msg) {
		super("[게시글 서비스] :" + msg);
	}
}
