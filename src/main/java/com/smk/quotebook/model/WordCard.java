package com.smk.quotebook.model;

public class WordCard {
	private String word;
	private String meaning;
	public WordCard() {
		super();
	}
	public String getWord() {
		return word;
	}
	public void setWord(String word) {
		this.word = word;
	}
	public String getMeaning() {
		return meaning;
	}
	public void setMeaning(String meaning) {
		this.meaning = meaning;
	}
	@Override
	public String toString() {
		return "WordCard [word=" + word + ", meaning=" + meaning + "]";
	}
	
	
}
