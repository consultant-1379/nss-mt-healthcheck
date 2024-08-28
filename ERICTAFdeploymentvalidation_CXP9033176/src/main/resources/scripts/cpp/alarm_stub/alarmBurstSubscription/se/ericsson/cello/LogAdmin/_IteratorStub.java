package se.ericsson.cello.LogAdmin;


/**
* se/ericsson/cello/LogAdmin/_IteratorStub.java .
* Generated by the IDL-to-Java compiler (portable), version "3.2"
* from LogAdmin_F.idl
* Wednesday, July 11, 2018 2:25:14 PM GMT+01:00
*/


//  from a query or retrieve operation.
public class _IteratorStub extends org.omg.CORBA.portable.ObjectImpl implements se.ericsson.cello.LogAdmin.Iterator
{


  //       In parameter how_many specify the quantity of records to get.
  public se.ericsson.cello.LogAdmin.LogRecord[] get (int how_many)
  {
            org.omg.CORBA.portable.InputStream $in = null;
            try {
                org.omg.CORBA.portable.OutputStream $out = _request ("get", true);
                $out.write_ulong (how_many);
                $in = _invoke ($out);
                se.ericsson.cello.LogAdmin.LogRecord $result[] = se.ericsson.cello.LogAdmin.RecordListHelper.read ($in);
                return $result;
            } catch (org.omg.CORBA.portable.ApplicationException $ex) {
                $in = $ex.getInputStream ();
                String _id = $ex.getId ();
                throw new org.omg.CORBA.MARSHAL (_id);
            } catch (org.omg.CORBA.portable.RemarshalException $rm) {
                return get (how_many        );
            } finally {
                _releaseReply ($in);
            }
  } // get


  //       iterator.
  public void destroy ()
  {
            org.omg.CORBA.portable.InputStream $in = null;
            try {
                org.omg.CORBA.portable.OutputStream $out = _request ("destroy", true);
                $in = _invoke ($out);
                return;
            } catch (org.omg.CORBA.portable.ApplicationException $ex) {
                $in = $ex.getInputStream ();
                String _id = $ex.getId ();
                throw new org.omg.CORBA.MARSHAL (_id);
            } catch (org.omg.CORBA.portable.RemarshalException $rm) {
                destroy (        );
            } finally {
                _releaseReply ($in);
            }
  } // destroy

  // Type-specific CORBA::Object operations
  private static String[] __ids = {
    "IDL:se/ericsson/cello/LogAdmin/Iterator:1.0"};

  public String[] _ids ()
  {
    return (String[])__ids.clone ();
  }

  private void readObject (java.io.ObjectInputStream s) throws java.io.IOException
  {
     String str = s.readUTF ();
     String[] args = null;
     java.util.Properties props = null;
     org.omg.CORBA.Object obj = org.omg.CORBA.ORB.init (args, props).string_to_object (str);
     org.omg.CORBA.portable.Delegate delegate = ((org.omg.CORBA.portable.ObjectImpl) obj)._get_delegate ();
     _set_delegate (delegate);
  }

  private void writeObject (java.io.ObjectOutputStream s) throws java.io.IOException
  {
     String[] args = null;
     java.util.Properties props = null;
     String str = org.omg.CORBA.ORB.init (args, props).object_to_string (this);
     s.writeUTF (str);
  }
} // class _IteratorStub
