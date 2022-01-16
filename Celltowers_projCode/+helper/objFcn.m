function f = objFcn(x, R)

pts = reshape(x,2,length(x)/2);
N = length(R);
f = 0;

for i = 1:N-1
  for j = i+1:N

    [p,q,areatotal] = areaIntersect(pts(:,i),R(i),pts(:,j),R(j)); 
    if isequal(pts(:,i),pts(:,j))
      f = f + areatotal + 1/(1e-8);%theoretical, it can't happen... in real life there is no meaning to put two cell towers in the same points
    else
      f = f + areatotal + 1/40 * 1/((norm(pts(:,i)-pts(:,j)))^2);
    end
  end
end

function [p,q,areatotal,numberOfPoints] = areaIntersect(C1,r1,C2,r2)
a = norm(C1-C2);

if isequal(a,0)
 
  p = [NaN;NaN]; q = [NaN;NaN]; numberOfPoints = Inf;
  areatotal = pi*min(r1,r2)^2;
  return
end
x = 0.5*(a + (r1^2 - r2^2)/a);
if r1^2 < x^2 
  p = [NaN;NaN]; q = [NaN;NaN];
  if r1 + r2 <= a % disjoint or intersected in one point from outside
    areatotal = 0; numberOfPoints = 0;
  else % one circle is inside the other with diff centers
    areatotal = pi*min(r1,r2)^2;
    numberOfPoints = Inf;
  end
  return
end
y = sqrt(r1^2 - x^2);

i = (C2-C1)/norm(C2-C1);

j = null(i');
p = C1 + i*x + j*y ;
q = C1 + i*x - j*y;

theta1 =  atan2(y,x);
theta2 =  atan2(y,a-x);

area1 = theta1*r1^2 - x*y;

area2 = theta2*r2^2 - (a-x)*y;

areatotal = area1 + area2;

if isequal(p,q)
  numberOfPoints = 1;
else
  numberOfPoints = 2;
end
