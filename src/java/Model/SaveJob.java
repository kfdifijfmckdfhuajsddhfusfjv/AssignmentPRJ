/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author Administrator
 */
public class SaveJob {
    private int saveJobId;
    private JobSeeker jobseeker;
    private Job job;
    private String saveDate ;

    public SaveJob(int saveJobId, JobSeeker jobseeker, Job job, String saveDate) {
        this.saveJobId = saveJobId;
        this.jobseeker = jobseeker;
        this.job = job;
        this.saveDate = saveDate;
    }

    public int getSaveJobId() {
        return saveJobId;
    }

    public void setSaveJobId(int saveJobId) {
        this.saveJobId = saveJobId;
    }

    public JobSeeker getJobseeker() {
        return jobseeker;
    }

    public void setJobseeker(JobSeeker jobseeker) {
        this.jobseeker = jobseeker;
    }

    public Job getJob() {
        return job;
    }

    public void setJob(Job job) {
        this.job = job;
    }

    public String getSaveDate() {
        return saveDate;
    }

    public void setSaveDate(String saveDate) {
        this.saveDate = saveDate;
    }

    
}
