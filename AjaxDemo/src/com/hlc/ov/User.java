package com.hlc.ov;

public class User {
private int uid;
private String uname;
private double price;
private String postion;
private String skill;
public int getUid() {
	return uid;
}
public void setUid(int uid) {
	this.uid = uid;
}
public String getUname() {
	return uname;
}
public void setUname(String uname) {
	this.uname = uname;
}
public double getPrice() {
	return price;
}
public void setPrice(double price) {
	this.price = price;
}
public String getPostion() {
	return postion;
}
public void setPostion(String postion) {
	this.postion = postion;
}
public String getSkill() {
	return skill;
}
public void setSkill(String skill) {
	this.skill = skill;
}
@Override
public int hashCode() {
	final int prime = 31;
	int result = 1;
	result = prime * result + ((postion == null) ? 0 : postion.hashCode());
	long temp;
	temp = Double.doubleToLongBits(price);
	result = prime * result + (int) (temp ^ (temp >>> 32));
	result = prime * result + ((skill == null) ? 0 : skill.hashCode());
	result = prime * result + uid;
	result = prime * result + ((uname == null) ? 0 : uname.hashCode());
	return result;
}
@Override
public boolean equals(Object obj) {
	if (this == obj)
		return true;
	if (obj == null)
		return false;
	if (getClass() != obj.getClass())
		return false;
	User other = (User) obj;
	if (postion == null) {
		if (other.postion != null)
			return false;
	} else if (!postion.equals(other.postion))
		return false;
	if (Double.doubleToLongBits(price) != Double.doubleToLongBits(other.price))
		return false;
	if (skill == null) {
		if (other.skill != null)
			return false;
	} else if (!skill.equals(other.skill))
		return false;
	if (uid != other.uid)
		return false;
	if (uname == null) {
		if (other.uname != null)
			return false;
	} else if (!uname.equals(other.uname))
		return false;
	return true;
}
public User(int uid, String uname, double price, String postion, String skill) {
	super();
	this.uid = uid;
	this.uname = uname;
	this.price = price;
	this.postion = postion;
	this.skill = skill;
}
public User() {
	// TODO Auto-generated constructor stub
}


}
