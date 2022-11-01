package member.beans;

public class RegisterException extends Exception
{
	  public RegisterException(){
	  		super();
	  	}
	  	
	  public RegisterException(String error){
	  		super( error );
	  	}
}
