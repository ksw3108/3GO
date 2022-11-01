package threego.beans;

public class ThreeGoException extends Exception{
	public ThreeGoException(){
  		super();
  	}
  	
  public ThreeGoException(String error){
  		super( error );
  	}
}
