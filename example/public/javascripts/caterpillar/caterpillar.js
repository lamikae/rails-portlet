function cp_toggle_category(c,categories) {
  c_el = document.getElementById(c);
  p_el = document.getElementById(c+'_portlets');

  if (p_el.style.display=='none') {
    p_el.style.display='block';
    c_el.style.background='yellow';
  }
  else {
    p_el.style.display='none';
    c_el.style.background='white';
  }


}