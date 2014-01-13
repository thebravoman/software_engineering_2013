package org.elsys.polymorphism;

public abstract class BaseRunnable implements Runnable {
	private String name;

	public BaseRunnable(String name) {
		this.name = name;
	}

	@Override
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	/**
	 * The equals method is common for {@link Kangaroo} and {@link Horse} - they
	 * inherit it from BaseRunnable.
	 */
	@Override
	public boolean equals(Object obj) {
		if (obj instanceof BaseRunnable) {
			return this.name.equals(((BaseRunnable) obj).getName());
		} else {
			return false;
		}
	}
}
