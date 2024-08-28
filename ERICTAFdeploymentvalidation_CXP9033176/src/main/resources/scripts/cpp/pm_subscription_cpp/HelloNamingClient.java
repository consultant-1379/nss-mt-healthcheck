import org.omg.CORBA.*;
import org.omg.CosNaming.* ;

public class HelloNamingClient
{     
  public static void printContext( NamingContext nc, String parent )
  { 
    try {
      final int batchSize = 1000;
      BindingListHolder bList = new BindingListHolder( );
      BindingIteratorHolder bIterator = new BindingIteratorHolder( );

      nc.list( batchSize, bList, bIterator );

      for ( int i=0; i < bList.value.length; i++ ) {
        NameComponent[] name = { bList.value[i].binding_name[0] };
        if (bList.value[i].binding_type == BindingType.ncontext) {
            NamingContext context = NamingContextHelper.narrow( 
                nc.resolve( name ) );
            System.out.println("NC : "+name[0].id+" , "+name[0].kind);
            printContext( context, parent + name[0].id + "." );
        } else {
            System.out.println( parent + name[0].id );
        }
      }

    } catch (Exception e) {
        System.out.println("ERROR : " + e) ;
    }
  }

  public static void main(String args[])
  {
    try{
      ORB orb = ORB.init(args, null);

      org.omg.CORBA.Object objRef = orb.resolve_initial_references("NameService");
      NamingContext rootCtx = NamingContextHelper.narrow(objRef);

      printContext( rootCtx, "" );

    } catch (Exception e) {
      System.out.println("ERROR : " + e) ;
      e.printStackTrace(System.out);
    }
  }
}
