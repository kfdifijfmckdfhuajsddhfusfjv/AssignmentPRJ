/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author Administrator
 */
public class CV {
    private int cvId ;
    private JobSeeker jobseeker;
    private String cvLink;
    
    public CV(int cvId, JobSeeker jobseeker, String cvLink) {
        this.cvId = cvId;
        this.jobseeker = jobseeker;
        this.cvLink = cvLink;
    }

    public CV() {
    }

    public int getCvId() {
        return cvId;
    }

    public void setCvId(int cvId) {
        this.cvId = cvId;
    }

    public JobSeeker getJobseeker() {
        return jobseeker;
    }

    public void setJobseeker(JobSeeker jobseeker) {
        this.jobseeker = jobseeker;
    }

    public String getCvLink() {
        return cvLink;
    }

    public void setCvLink(String cvLink) {
        this.cvLink = cvLink;
    }

    
    
}
