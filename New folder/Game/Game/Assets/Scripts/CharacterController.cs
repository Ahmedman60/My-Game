﻿using UnityEngine;
using System.Collections;



public class CharacterController : MonoBehaviour {
	
	
	public float maxSpeed = 10f;
	bool facingRight = true;
	
	Animator anim;
	
	
	
	
	
	
	///////Jump animation variables
	bool grounded = false;
	public Transform groundCheck;
	float groundRadius = 0.2f;
	
	public LayerMask whatIsGround;
	
	public float jumpForce = 700;
	
	
	
	
	
	
	// Use this for initialization
	void Start () {
		
		anim = GetComponent<Animator> ();
		
	}
	
	// Update is called once per frame
	void FixedUpdate () {
		
		
		
		
		//jumping check
		grounded = Physics2D.OverlapCircle (groundCheck.position, groundRadius, whatIsGround);
		anim.SetBool ("Ground", grounded);
		
		
		
		anim.SetFloat ("vSpeed", GetComponent<Rigidbody2D>().velocity.y);
		
		
		
		
		
		float move = Input.GetAxis ("Horizontal");
		
		anim.SetFloat ("Speed", Mathf.Abs (move));
		
		//Diving maxSpeed by 2 to slow down the walker
		GetComponent<Rigidbody2D>().velocity = new Vector2 (move * maxSpeed/2, GetComponent<Rigidbody2D>().velocity.y);
		
		if (move > 0 && !facingRight)
			Flip ();
		else if (move < 0 && facingRight)
			Flip ();
		
	}
	
	
	
	
	
	void Update() {
		
		
		
		if (grounded && Input.GetKeyDown (KeyCode.Space)) {
			
			anim.SetBool("Ground", false); 
			GetComponent<Rigidbody2D>().AddForce(new Vector2(0,jumpForce)); 
			
			
		}
		
		

	}
	
	
	
	
	void Flip() {
		facingRight = !facingRight;
		Vector3 theScale = transform.localScale;
		theScale.x *= -1;
		transform.localScale = theScale;
	}
	
}





