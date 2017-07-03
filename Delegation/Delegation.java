public class Delegation {
	public static void main(String args[]) {
		E e = new E();
		System.out.println(e.f()+e.g()+e.h()+e.p(1)+e.q(2)+e.r());

		E2 e2 = new E2();
		System.out.println(e2.f()+e2.g()+e2.h()+e2.p(1)+e2.q(2)+e2.r());
		
		F f = new F();
		System.out.println(f.f()+f.g()+f.h()+f.p(1)+f.q(2)+f.r());
		
		F2 f2 = new F2();
		System.out.println(f2.f()+f2.g()+f2.h()+f2.p(1)+f2.q(2)+f2.r());
 
	}
}

abstract class A {
	int a1 = 1;
	int a2 = 2;

	public int f() {
		return a1 + p(100) + q(100);
	}

	protected abstract int p(int m);

	protected abstract int q(int m);
}

class B extends A {
	int b1 = 10;
	int b2 = 20;

	public int g() {
		return f() + this.q(200);
	}

	public int p(int m) {
		return m + b1;
	}

	public int q(int m) {
		return m + b2;
	}
}

abstract class C extends B {
	int c1 = 100;
	int c2 = 200;

	public int r() {
		return f() + g() + h() + c1;
	}

	public int q(int m) {
		return m + a2 + b2 + c2;
	}

	protected abstract int h();
}

class D extends C {
	int d1 = 500;
	int d2 = 600;

	public int r() {
		return f() + g() + h() + c1;
	}

	public int p(int m) {
		return super.p(m) + d2;
	}

	public int h() {
		return a1 + b1 + d1;
	}

}

class E extends C {
	int e1 = 700;
	int e2 = 800;

	public int q(int m) {
		return super.q(m) + p(m) + c2;
	}

	public int h() {
		return a1 + b1 + c1;
	}

}

class F extends D {
	int f1 = 900;
	int f2 = 1000;

	public int q(int m) {
		return p(m) + super.q(m) + a1 + b1 + d1;
	}

	public int h() {
		return a1 + c2 + d1;
	}

}


// ---- Define interfaces IA, IB, IC, ID, IE, and IF ----

interface IA
{
int f();
int p(int m);
int q(int m);
}

interface IB extends IA
{
int g();
}

interface IC extends IB
{
int r();
int h();
}

interface ID extends IC
{
}

interface IE extends IC
{
}

interface IF extends ID
{
}

//---------

//---------

// ---- Complete the definitions of classes ----
// ----     A2, B2, C2, D2, E2, and F2      ----

class A2 implements IA {
int a1 = 1;
int a2 = 2;
public A2(IA p)
{
	this2 = p;
}

public int f()
{
	return a1 + p(100) + q(100);
}

public int p(int m)
{
	return this2.p(m);
}

public int q(int m)
{
	return this2.q(m);
}

IA this2;
}

class B2 implements IB{
int b1 = 10;
int b2 = 20;
public B2()
{
	super2 = new A2(this);
}

public B2(IB p)
{
	this2 = p;
	super2 = new A2(this2);
}
	
public int g() {
	return f() + this2.q(200);
}

public int p(int m) {
	return m + b1;
}

public int q(int m) {
	return m + b2;
}

public int f()
{
	return super2.f();
}

A2 super2;
IB this2;
}

class C2 implements IC {
	int c1 = 100;
	int c2 = 200;
	public C2()
	{
		super2 = new B2(this);
	}
	public C2(IC p)
	{
		this2 = p;
		super2 = new B2(this2);
	}
	
	public int r() {
		return this2.f() + this2.g() + this2.h() + c1;
	}

	public int q(int m) {
		return m + super2.super2.a2 + super2.b2 + c2;
	}
	
	public int p(int m)
	{
		return super2.p(m);
	}
	
	public int f()
	{
		return super2.f();
	}
	
	public int g()
	{
		return super2.g();
	}
	
	public int h()
	{
		return this2.h();
	}
	
	B2 super2;
	IC this2;
	
}

class D2 implements ID {	
	int d1 = 500;
	int d2 = 600;
	public D2()
	{
		super2 = new C2(this);
	}
	
	public D2(ID p)
	{
		this2 = p;
		super2 = new C2(this2);
	}
	
	public int r() {
		return f() + g() + this2.h() + super2.c1;
	}

	public int p(int m) {
		return super2.p(m) + d2;
	}

	public int h() {
		return super2.super2.super2.a1 + super2.super2.b1 + d1;
	}

	public int q(int m) {
		return m + super2.super2.super2.a2 + super2.super2.b2 + super2.c2;
	}
	
	public int f()
	{
		return super2.f();
	}
	
	public int g()
	{
		return super2.g();
	}
	
	C2 super2;
	ID this2;
}

class E2 implements IE {
	int e1 = 700;
	int e2 = 800;
	public E2()
	{
		super2 = new C2(this);
	}
	
	public int q(int m) {
		return super2.q(m) + super2.p(m) + super2.c2;
	}


	public int h() {
		return super2.super2.super2.a1 + super2.super2.b1 + super2.c1;
	}
	
	public int p(int m) {
		return super2.p(m);
	}
	
	public int f()
	{
		return super2.f();
	}
	
	public int g()
	{
		return super2.g();
	}
	
	public int r() {
		return super2.r();
	}
	
C2 super2;
}

class F2 implements IF {
	int f1 = 900;
	int f2 = 1000;
	public F2()
	{
		super2 = new D2(this);
	}
	
	public int q(int m) {
		return p(m) + super2.q(m) + super2.super2.super2.super2.a1 + super2.super2.super2.b1 + super2.d1;
	}

	public int h() {
		return super2.super2.super2.super2.a1 + super2.super2.c2 + super2.d1;
	}
	
	public int f()
	{
		return super2.f();
	}
	
	public int g()
	{
		return super2.g();
	}
	
	public int r() {
		return super2.r();
	}

	public int p(int m) {
		return super2.p(m);
	}
	D2 super2; 
}


