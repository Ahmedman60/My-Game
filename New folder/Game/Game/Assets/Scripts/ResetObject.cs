using UnityEngine;
using System.Collections;

public class ResetObject : MonoBehaviour {

	private Vector3 pos;               
	

	void Start () {

		pos = transform.position;
	}
	

	void Update () {

		if (transform.position.y < -8)
		{

			this.GetComponent<Rigidbody2D>().isKinematic = true;

			transform.position = pos;
		
			this.GetComponent<Rigidbody2D>().isKinematic = false;
		}
	}
}
