<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<style>
.navbar-nav.navbar-center{
    position: absolute;
    left: 50%;
    transform: translatex(-50%);
}
</style>
<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
  <!-- Brand -->
  <a class="navbar-brand" href="/">Pino</a>
  <!-- Links -->
  <ul class="nav navbar-nav navbar-center">
   <li class="nav-item">
      <a class="nav-link" href="/">Home<a>
    </li>
    <li class="nav-item">
      <a class="nav-link" href="InputForm.do">Input<a>
    </li>
    <li class="nav-item">
      <a class="nav-link" href="/SearchForm">Search</a>
    </li>

    <!-- Dropdown -->
 <!--    <li class="nav-item dropdown">
      <a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">
        Dropdown link
      </a>
      <div class="dropdown-menu">
        <a class="dropdown-item" href="#">Link 1</a>
        <a class="dropdown-item" href="#">Link 2</a>
        <a class="dropdown-item" href="#">Link 3</a>
      </div>
    </li> -->
  </ul>
</nav>