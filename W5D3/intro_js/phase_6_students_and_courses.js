class Student{
  constructor(fname, lname){
    this.fname = fname;
    this.lname = lname;
    this.courses = [];
  }
}

Student.prototype.name = function(){
  return this.fname + " " + this.lname;
};

Student.prototype.enroll = function(course) {
  if (!this.courses.includes(course)) {
    this.courses.push(course);
    course.addStudent(this.name);
  }
};

Student.prototype.courseLoad = function() {
  let load = {};
  for (let i = 0; i < this.courses.length; i++) {
    if (load[this.courses[i].department]) {
      load[this.courses[i].department] += this.courses[i].credits;
    }
    else {
      load[this.courses[i].department] = this.courses[i].credits;
    }
  }
  return load;
};


class Course {
  constructor(name, department, credits) {
    this.name = name;
    this.department = department;
    this.credits = credits;
    this.students = [];
  }
}

Course.prototype.addStudent = function(student) {
  this.students.push(student);
};

const student1 = new Student("Jim", "Bob");
const course1 = new Course("Biology", "Science", 3);
const course3 = new Course("Physics", "Science", 3);
const course2 = new Course("Tractor Pullin", "Shop", 3);

student1.enroll(course1);
student1.enroll(course2);
student1.enroll(course3);
console.log(student1.courseLoad());
