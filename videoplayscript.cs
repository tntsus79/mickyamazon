using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
using UnityEngine.Video;

public class videoplayerscript : MonoBehaviour
{

    public int timetostop;
    public GameObject videoplay;
    private GameObject target;
    private VideoPlayer vp;
    public float sec = 4f;
    public float xAngle, yAngle, zAngle;
    private float distance = 75.0f;
    public float xAngle2, yAngle2, zAngle2;
    public GameObject videoPlane;
    public Vector3 startPos, endPos, startRot, endRot;
    public GameObject[] buttons;
    private bool buttonsActive = false;
    private bool isPlaying = false;
    // Start is called before the first frame update
    void Start()
    {
        //videoplay.SetActive(false);
        target = GameObject.FindWithTag("Television");
        vp = videoplay.GetComponent<VideoPlayer>();
        vp.Pause();
        startPos = videoPlane.transform.position;
        buttonsActive = false;
        UpdateButtons();
        
    }

    public void LateCall()
    {

        //videoplay.SetActive(false);
        vp.Stop();
        /*GameObject[] Televisionparts2 = GameObject.FindGameObjectsWithTag("televisionplayer");
        foreach (GameObject obst2 in Televisionparts2)
            obst2.transform.position = new Vector3(6.4f, 265.8f, -29);

        foreach (GameObject obst3 in Televisionparts2)
            obst3.transform.Rotate(xAngle2, yAngle2, zAngle2);*/

        videoPlane.transform.position = startPos;
        videoPlane.transform.rotation = Quaternion.Euler(startRot);
        buttonsActive = false;
        UpdateButtons();
        Debug.Log("done");

    }

    // Update is called once per frame
    void Update()
    {
        Camera playerCamera = Camera.main;
        
 

        RaycastHit hit;

        if (Input.GetButtonDown("Fire1"))
        {

            Debug.Log("has clicked");

            Vector3 mousepos = Input.mousePosition;

            Ray ray = Camera.main.ScreenPointToRay(mousepos);
            int layerMask = 1 << 7;

            if (Physics.Raycast(ray, out hit, Mathf.Infinity, layerMask))
            {
                Debug.Log("has hit");
                if (hit.transform.CompareTag("Television")) Debug.Log("tv exists");
                {

                    Debug.Log(endPos);
                    videoPlane.transform.position = endPos;
                    videoPlane.transform.rotation = Quaternion.Euler(endRot);
                    buttonsActive = true;
                    UpdateButtons();

                    Debug.Log("has found TV");
                    videoplay.SetActive(true);
                    vp.Play();
                    isPlaying = true;
                   
                    Debug.Log("playing");



                }
            }
        }
    }

    void UpdateButtons()
    {
        foreach (GameObject button in buttons)
        {
            button.SetActive(buttonsActive);
        }
    }


    public void TogglePause()
    {
        if (isPlaying)
        {
            vp.Pause();
        }
        else
        {
            vp.Play();
        }
        isPlaying = !isPlaying;
    }
}