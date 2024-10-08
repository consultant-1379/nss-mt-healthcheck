package ConfigExtended;


/**
* ConfigExtended/MOInfo.java .
* Generated by the IDL-to-Java compiler (portable), version "3.2"
* from configuration_ext_K.idl
* Tuesday, May 22, 2018 12:36:12 PM GMT+01:00
*/

public final class MOInfo implements org.omg.CORBA.portable.IDLEntity
{
  public long moId = (long)0;
  public String type = null;
  public String localDN = null;
  public String prefix = null;

  public MOInfo ()
  {
  } // ctor

  public MOInfo (long _moId, String _type, String _localDN, String _prefix)
  {
    moId = _moId;
    type = _type;
    localDN = _localDN;
    prefix = _prefix;
  } // ctor
 
  public String toString ()
  {
     StringBuilder sb = new StringBuilder();
     sb.append("[");
     sb.append("{moId," + moId + "}");
     sb.append("{type," + type + "}");
     sb.append("{localDN," + localDN + "}");
     sb.append("{prefix," + prefix + "}");
     sb.append("]");
     return sb.toString();
  }
} // class MOInfo
