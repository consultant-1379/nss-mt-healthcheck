package CosNaming;


/**
* CosNaming/_NamingContextStub.java .
* Generated by the IDL-to-Java compiler (portable), version "3.2"
* from CosNaming.idl
* Tuesday, May 22, 2018 12:36:11 PM GMT+01:00
*/

public class _NamingContextStub extends org.omg.CORBA.portable.ObjectImpl implements CosNaming.NamingContext
{

  public void bind (CosNaming.NameComponent[] n, org.omg.CORBA.Object obj) throws CosNaming.NamingContextPackage.NotFound, CosNaming.NamingContextPackage.CannotProceed, CosNaming.NamingContextPackage.InvalidName, CosNaming.NamingContextPackage.AlreadyBound
  {
            org.omg.CORBA.portable.InputStream $in = null;
            try {
                org.omg.CORBA.portable.OutputStream $out = _request ("bind", true);
                CosNaming.NameHelper.write ($out, n);
                org.omg.CORBA.ObjectHelper.write ($out, obj);
                $in = _invoke ($out);
                return;
            } catch (org.omg.CORBA.portable.ApplicationException $ex) {
                $in = $ex.getInputStream ();
                String _id = $ex.getId ();
                if (_id.equals ("IDL:CosNaming/NamingContext/NotFound:1.0"))
                    throw CosNaming.NamingContextPackage.NotFoundHelper.read ($in);
                else if (_id.equals ("IDL:CosNaming/NamingContext/CannotProceed:1.0"))
                    throw CosNaming.NamingContextPackage.CannotProceedHelper.read ($in);
                else if (_id.equals ("IDL:CosNaming/NamingContext/InvalidName:1.0"))
                    throw CosNaming.NamingContextPackage.InvalidNameHelper.read ($in);
                else if (_id.equals ("IDL:CosNaming/NamingContext/AlreadyBound:1.0"))
                    throw CosNaming.NamingContextPackage.AlreadyBoundHelper.read ($in);
                else
                    throw new org.omg.CORBA.MARSHAL (_id);
            } catch (org.omg.CORBA.portable.RemarshalException $rm) {
                bind (n, obj        );
            } finally {
                _releaseReply ($in);
            }
  } // bind

  public void rebind (CosNaming.NameComponent[] n, org.omg.CORBA.Object obj) throws CosNaming.NamingContextPackage.NotFound, CosNaming.NamingContextPackage.CannotProceed, CosNaming.NamingContextPackage.InvalidName
  {
            org.omg.CORBA.portable.InputStream $in = null;
            try {
                org.omg.CORBA.portable.OutputStream $out = _request ("rebind", true);
                CosNaming.NameHelper.write ($out, n);
                org.omg.CORBA.ObjectHelper.write ($out, obj);
                $in = _invoke ($out);
                return;
            } catch (org.omg.CORBA.portable.ApplicationException $ex) {
                $in = $ex.getInputStream ();
                String _id = $ex.getId ();
                if (_id.equals ("IDL:CosNaming/NamingContext/NotFound:1.0"))
                    throw CosNaming.NamingContextPackage.NotFoundHelper.read ($in);
                else if (_id.equals ("IDL:CosNaming/NamingContext/CannotProceed:1.0"))
                    throw CosNaming.NamingContextPackage.CannotProceedHelper.read ($in);
                else if (_id.equals ("IDL:CosNaming/NamingContext/InvalidName:1.0"))
                    throw CosNaming.NamingContextPackage.InvalidNameHelper.read ($in);
                else
                    throw new org.omg.CORBA.MARSHAL (_id);
            } catch (org.omg.CORBA.portable.RemarshalException $rm) {
                rebind (n, obj        );
            } finally {
                _releaseReply ($in);
            }
  } // rebind

  public void bind_context (CosNaming.NameComponent[] n, CosNaming.NamingContext nc) throws CosNaming.NamingContextPackage.NotFound, CosNaming.NamingContextPackage.CannotProceed, CosNaming.NamingContextPackage.InvalidName, CosNaming.NamingContextPackage.AlreadyBound
  {
            org.omg.CORBA.portable.InputStream $in = null;
            try {
                org.omg.CORBA.portable.OutputStream $out = _request ("bind_context", true);
                CosNaming.NameHelper.write ($out, n);
                CosNaming.NamingContextHelper.write ($out, nc);
                $in = _invoke ($out);
                return;
            } catch (org.omg.CORBA.portable.ApplicationException $ex) {
                $in = $ex.getInputStream ();
                String _id = $ex.getId ();
                if (_id.equals ("IDL:CosNaming/NamingContext/NotFound:1.0"))
                    throw CosNaming.NamingContextPackage.NotFoundHelper.read ($in);
                else if (_id.equals ("IDL:CosNaming/NamingContext/CannotProceed:1.0"))
                    throw CosNaming.NamingContextPackage.CannotProceedHelper.read ($in);
                else if (_id.equals ("IDL:CosNaming/NamingContext/InvalidName:1.0"))
                    throw CosNaming.NamingContextPackage.InvalidNameHelper.read ($in);
                else if (_id.equals ("IDL:CosNaming/NamingContext/AlreadyBound:1.0"))
                    throw CosNaming.NamingContextPackage.AlreadyBoundHelper.read ($in);
                else
                    throw new org.omg.CORBA.MARSHAL (_id);
            } catch (org.omg.CORBA.portable.RemarshalException $rm) {
                bind_context (n, nc        );
            } finally {
                _releaseReply ($in);
            }
  } // bind_context

  public void rebind_context (CosNaming.NameComponent[] n, CosNaming.NamingContext nc) throws CosNaming.NamingContextPackage.NotFound, CosNaming.NamingContextPackage.CannotProceed, CosNaming.NamingContextPackage.InvalidName
  {
            org.omg.CORBA.portable.InputStream $in = null;
            try {
                org.omg.CORBA.portable.OutputStream $out = _request ("rebind_context", true);
                CosNaming.NameHelper.write ($out, n);
                CosNaming.NamingContextHelper.write ($out, nc);
                $in = _invoke ($out);
                return;
            } catch (org.omg.CORBA.portable.ApplicationException $ex) {
                $in = $ex.getInputStream ();
                String _id = $ex.getId ();
                if (_id.equals ("IDL:CosNaming/NamingContext/NotFound:1.0"))
                    throw CosNaming.NamingContextPackage.NotFoundHelper.read ($in);
                else if (_id.equals ("IDL:CosNaming/NamingContext/CannotProceed:1.0"))
                    throw CosNaming.NamingContextPackage.CannotProceedHelper.read ($in);
                else if (_id.equals ("IDL:CosNaming/NamingContext/InvalidName:1.0"))
                    throw CosNaming.NamingContextPackage.InvalidNameHelper.read ($in);
                else
                    throw new org.omg.CORBA.MARSHAL (_id);
            } catch (org.omg.CORBA.portable.RemarshalException $rm) {
                rebind_context (n, nc        );
            } finally {
                _releaseReply ($in);
            }
  } // rebind_context

  public org.omg.CORBA.Object resolve (CosNaming.NameComponent[] n) throws CosNaming.NamingContextPackage.NotFound, CosNaming.NamingContextPackage.CannotProceed, CosNaming.NamingContextPackage.InvalidName
  {
            org.omg.CORBA.portable.InputStream $in = null;
            try {
                org.omg.CORBA.portable.OutputStream $out = _request ("resolve", true);
                CosNaming.NameHelper.write ($out, n);
                $in = _invoke ($out);
                org.omg.CORBA.Object $result = org.omg.CORBA.ObjectHelper.read ($in);
                return $result;
            } catch (org.omg.CORBA.portable.ApplicationException $ex) {
                $in = $ex.getInputStream ();
                String _id = $ex.getId ();
                if (_id.equals ("IDL:CosNaming/NamingContext/NotFound:1.0"))
                    throw CosNaming.NamingContextPackage.NotFoundHelper.read ($in);
                else if (_id.equals ("IDL:CosNaming/NamingContext/CannotProceed:1.0"))
                    throw CosNaming.NamingContextPackage.CannotProceedHelper.read ($in);
                else if (_id.equals ("IDL:CosNaming/NamingContext/InvalidName:1.0"))
                    throw CosNaming.NamingContextPackage.InvalidNameHelper.read ($in);
                else
                    throw new org.omg.CORBA.MARSHAL (_id);
            } catch (org.omg.CORBA.portable.RemarshalException $rm) {
                return resolve (n        );
            } finally {
                _releaseReply ($in);
            }
  } // resolve

  public void unbind (CosNaming.NameComponent[] n) throws CosNaming.NamingContextPackage.NotFound, CosNaming.NamingContextPackage.CannotProceed, CosNaming.NamingContextPackage.InvalidName
  {
            org.omg.CORBA.portable.InputStream $in = null;
            try {
                org.omg.CORBA.portable.OutputStream $out = _request ("unbind", true);
                CosNaming.NameHelper.write ($out, n);
                $in = _invoke ($out);
                return;
            } catch (org.omg.CORBA.portable.ApplicationException $ex) {
                $in = $ex.getInputStream ();
                String _id = $ex.getId ();
                if (_id.equals ("IDL:CosNaming/NamingContext/NotFound:1.0"))
                    throw CosNaming.NamingContextPackage.NotFoundHelper.read ($in);
                else if (_id.equals ("IDL:CosNaming/NamingContext/CannotProceed:1.0"))
                    throw CosNaming.NamingContextPackage.CannotProceedHelper.read ($in);
                else if (_id.equals ("IDL:CosNaming/NamingContext/InvalidName:1.0"))
                    throw CosNaming.NamingContextPackage.InvalidNameHelper.read ($in);
                else
                    throw new org.omg.CORBA.MARSHAL (_id);
            } catch (org.omg.CORBA.portable.RemarshalException $rm) {
                unbind (n        );
            } finally {
                _releaseReply ($in);
            }
  } // unbind

  public CosNaming.NamingContext new_context ()
  {
            org.omg.CORBA.portable.InputStream $in = null;
            try {
                org.omg.CORBA.portable.OutputStream $out = _request ("new_context", true);
                $in = _invoke ($out);
                CosNaming.NamingContext $result = CosNaming.NamingContextHelper.read ($in);
                return $result;
            } catch (org.omg.CORBA.portable.ApplicationException $ex) {
                $in = $ex.getInputStream ();
                String _id = $ex.getId ();
                throw new org.omg.CORBA.MARSHAL (_id);
            } catch (org.omg.CORBA.portable.RemarshalException $rm) {
                return new_context (        );
            } finally {
                _releaseReply ($in);
            }
  } // new_context

  public CosNaming.NamingContext bind_new_context (CosNaming.NameComponent[] n) throws CosNaming.NamingContextPackage.NotFound, CosNaming.NamingContextPackage.CannotProceed, CosNaming.NamingContextPackage.InvalidName, CosNaming.NamingContextPackage.AlreadyBound
  {
            org.omg.CORBA.portable.InputStream $in = null;
            try {
                org.omg.CORBA.portable.OutputStream $out = _request ("bind_new_context", true);
                CosNaming.NameHelper.write ($out, n);
                $in = _invoke ($out);
                CosNaming.NamingContext $result = CosNaming.NamingContextHelper.read ($in);
                return $result;
            } catch (org.omg.CORBA.portable.ApplicationException $ex) {
                $in = $ex.getInputStream ();
                String _id = $ex.getId ();
                if (_id.equals ("IDL:CosNaming/NamingContext/NotFound:1.0"))
                    throw CosNaming.NamingContextPackage.NotFoundHelper.read ($in);
                else if (_id.equals ("IDL:CosNaming/NamingContext/CannotProceed:1.0"))
                    throw CosNaming.NamingContextPackage.CannotProceedHelper.read ($in);
                else if (_id.equals ("IDL:CosNaming/NamingContext/InvalidName:1.0"))
                    throw CosNaming.NamingContextPackage.InvalidNameHelper.read ($in);
                else if (_id.equals ("IDL:CosNaming/NamingContext/AlreadyBound:1.0"))
                    throw CosNaming.NamingContextPackage.AlreadyBoundHelper.read ($in);
                else
                    throw new org.omg.CORBA.MARSHAL (_id);
            } catch (org.omg.CORBA.portable.RemarshalException $rm) {
                return bind_new_context (n        );
            } finally {
                _releaseReply ($in);
            }
  } // bind_new_context

  public void destroy () throws CosNaming.NamingContextPackage.NotEmpty
  {
            org.omg.CORBA.portable.InputStream $in = null;
            try {
                org.omg.CORBA.portable.OutputStream $out = _request ("destroy", true);
                $in = _invoke ($out);
                return;
            } catch (org.omg.CORBA.portable.ApplicationException $ex) {
                $in = $ex.getInputStream ();
                String _id = $ex.getId ();
                if (_id.equals ("IDL:CosNaming/NamingContext/NotEmpty:1.0"))
                    throw CosNaming.NamingContextPackage.NotEmptyHelper.read ($in);
                else
                    throw new org.omg.CORBA.MARSHAL (_id);
            } catch (org.omg.CORBA.portable.RemarshalException $rm) {
                destroy (        );
            } finally {
                _releaseReply ($in);
            }
  } // destroy

  public void list (int how_many, CosNaming.BindingListHolder bl, CosNaming.BindingIteratorHolder bi)
  {
            org.omg.CORBA.portable.InputStream $in = null;
            try {
                org.omg.CORBA.portable.OutputStream $out = _request ("list", true);
                $out.write_ulong (how_many);
                $in = _invoke ($out);
                bl.value = CosNaming.BindingListHelper.read ($in);
                bi.value = CosNaming.BindingIteratorHelper.read ($in);
                return;
            } catch (org.omg.CORBA.portable.ApplicationException $ex) {
                $in = $ex.getInputStream ();
                String _id = $ex.getId ();
                throw new org.omg.CORBA.MARSHAL (_id);
            } catch (org.omg.CORBA.portable.RemarshalException $rm) {
                list (how_many, bl, bi        );
            } finally {
                _releaseReply ($in);
            }
  } // list

  // Type-specific CORBA::Object operations
  private static String[] __ids = {
    "IDL:CosNaming/NamingContext:1.0"};

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
} // class _NamingContextStub
