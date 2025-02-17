/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

import DAO.JobDAO;

/**
 *
 * @author Administrator
 */
public class Job {

    private int jobId;
    private Company company;
    private Recruiter recruiter;
    private Category category;
    private String jobTitle;
    private String jobDescription;
    private String requirements;
    private String position;
    private String experience;
    private String skills;
    private int numberOfSeeker;
    private float salary;

    public Job() {
    }

    public Job(int jobId, Company company, Recruiter recruiter, Category category, String jobTitle, String jobDescription, String requirements, String position, String experience, String skills, int numberOfSeeker, float salary) {
        this.jobId = jobId;
        this.company = company;
        this.recruiter = recruiter;
        this.category = category;
        this.jobTitle = jobTitle;
        this.jobDescription = jobDescription;
        this.requirements = requirements;
        this.position = position;
        this.experience = experience;
        this.skills = skills;
        this.numberOfSeeker = numberOfSeeker;
        this.salary = salary;
    }

    public int getJobId() {
        return jobId;
    }

    public void setJobId(int jobId) {
        this.jobId = jobId;
    }

    public Company getCompany() {
        return company;
    }

    public void setCompany(Company company) {
        this.company = company;
    }

    public Recruiter getRecruiter() {
        return recruiter;
    }

    public void setRecruiter(Recruiter recruiter) {
        this.recruiter = recruiter;
    }

    public Category getCategory() {
        return category;
    }

    public void setCategory(Category category) {
        this.category = category;
    }

    public String getJobTitle() {
        return jobTitle;
    }

    public void setJobTitle(String jobTitle) {
        this.jobTitle = jobTitle;
    }

    public String getJobDescription() {
        return jobDescription;
    }

    public void setJobDescription(String jobDescription) {
        this.jobDescription = jobDescription;
    }

    public String getRequirements() {
        return requirements;
    }

    public void setRequirements(String requirements) {
        this.requirements = requirements;
    }

    public String getPosition() {
        return position;
    }

    public void setPosition(String position) {
        this.position = position;
    }

    public String getExperience() {
        return experience;
    }

    public void setExperience(String experience) {
        this.experience = experience;
    }

    public String getSkills() {
        return skills;
    }

    public void setSkills(String skills) {
        this.skills = skills;
    }

    public int getNumberOfSeeker() {
        return numberOfSeeker;
    }

    public void setNumberOfSeeker(int numberOfSeeker) {
        this.numberOfSeeker = numberOfSeeker;
    }

    public float getSalary() {
        return salary;
    }

    public void setSalary(float salary) {
        this.salary = salary;
    }

    
   
}
