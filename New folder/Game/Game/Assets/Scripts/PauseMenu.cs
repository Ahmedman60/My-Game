using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class PauseMenu : MonoBehaviour {

    public GameObject PauseUI;
    private bool pause = false;
    private void Start()
    {
        PauseUI.SetActive(false);
    }
    private void Update()
    {
        if (Input.GetButtonDown("Pause"))
        {
            pause = !pause;
        }
        if (pause)
        {
            PauseUI.SetActive(true);
            Time.timeScale = 0;
        }
        if (!pause)
        {
            PauseUI.SetActive(false);
            Time.timeScale = 1;
        }
    }
    public void resume()
    {
        pause = false;
    }
    public void exit()
    {
        Application.Quit();

    }
    public void Restart()
    {
        Application.LoadLevel(0);

    }
}
