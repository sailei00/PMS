package com.fdmy.model;

import java.util.HashMap;
import java.util.Map;

public class ValidationInfo {
	boolean valid = false;
	Map<String, String> result = new HashMap<>();

	public boolean getValid() {
		return valid;
	}

	public void setValid(Boolean valid) {
		this.valid = valid;
	}

	public Map<String, String> getResult() {
		return result;
	}

	public void setResult(Map<String, String> result) {
		this.result = result;
	}

}
