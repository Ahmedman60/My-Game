using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Level2Script : MonoBehaviour {

    private void OnTriggerEnter2D(Collider2D b)
    {
        if (b.tag == "Player")
        {//mohamed fathallah
            Application.LoadLevel(2);
        }
    }

    // Use this for initialization
 
	
	// Update is called once per frame
	
}
