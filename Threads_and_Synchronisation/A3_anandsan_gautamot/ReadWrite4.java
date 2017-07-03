package Qns4;

import java.util.Random;
import java.util.concurrent.Semaphore;


public class ReadWrite4{
	
	public static void main(String[] args) {

		Database d = new Database();

		Writer w1 = new Writer(d,1);
		Writer w2 = new Writer(d,10);
		Writer w3 = new Writer(d,100);
		Writer w4 = new Writer(d,1000);
		Writer w5 = new Writer(d,10000);
		Reader r1 = new Reader(d);
		Reader r2 = new Reader(d);
		Reader r3 = new Reader(d);
		Reader r4 = new Reader(d);
		Reader r5 = new Reader(d);
		Reader r6 = new Reader(d);
		Reader r7 = new Reader(d);
		Reader r8 = new Reader(d);
		Reader r9 = new Reader(d);
		Reader r10 = new Reader(d);

		w1.start();
		r1.start();
		r2.start();
		w2.start();
		r3.start();
		r4.start();
		w3.start();
		r5.start();
		r6.start();
		w4.start();
		r7.start();
		r8.start();
		w5.start();
		r9.start();
		r10.start();

	}
}

class Database {
	int data = 0;
	int r = 0;
	int w = 0;
	boolean w_starv = false;
	int ww = 0;
	int wr = 0;
	Semaphore s1 = new Semaphore(1);
	Semaphore s2 = new Semaphore(0);
 
	public void request_read() throws InterruptedException{
		s1.acquire();
		wr++;
		while (w == 1||w_starv)
		       try {//wait();
		    	   s1.release();
		    	   s2.acquire();
		    	   s1.acquire();
		       }
		       catch (Exception e) {} 		 
		r++;
		wr--;
		s1.release();
	}

	public int read() throws InterruptedException{
		 s1.acquire();
		 int my_data = data;
		 try {Thread.sleep(50);} catch (Exception e) {}
 		 s1.release();
		 return my_data; 
	}
	public void done_read() throws InterruptedException{
		s1.acquire();
		r--;
		while(s2.hasQueuedThreads())
			s2.release();
		s1.release();
	}
	
	public void request_write() throws InterruptedException{
		s1.acquire();
		ww++;
		  while (r > 0 || w == 1)
			  try {//wait();
		    	   s1.release();
		    	   s2.acquire();
		    	   s1.acquire();
			  		w_starv=true;
			  } 
	          catch (Exception e) {}
		  w = 1;
		  ww--;
  		s1.release();
	}
	
	public void write(int x) throws InterruptedException{
		s1.acquire();
		if(ww==0)
		  w_starv = false;
		  try {Thread.sleep(200);}
		  catch (InterruptedException e) {}
		  data = data + x; 
		s1.release();
	}
	
	public synchronized void done_write() throws InterruptedException{
		s1.acquire();
		w = 0;
		while(s2.hasQueuedThreads())
			s2.release();
		s1.release();
	}
	
// fill in your code over here

}

class Reader extends Thread {
	Database d;

	public Reader(Database d) {
		this.d = d;
	}

	public void run() {

		for (int i = 0; i < 5; i++){
			try {Thread.sleep(new Random().nextInt(750));}
			catch (InterruptedException e) {}
			
			try {
				d.request_read();
				System.out.println(d.read());
				d.done_read();
			} catch (InterruptedException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}
	}
}

class Writer extends Thread {
	Database d;
	int x;

	public Writer(Database d, int x) {
		this.d = d;
		this.x = x;
	}

	public void run() {
		for (int i = 0; i < 5; i++) {
			try {Thread.sleep(new Random().nextInt(200));}
			catch (InterruptedException e) {}
			try {
				d.request_write();
				d.write(x);
				d.done_write();
			} catch (InterruptedException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
}

